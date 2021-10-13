# RailsJwtApi

## Work in progress
Simple jwt rails authentication

## Features
##### Sign Up
##### Sign in
##### Authenticate any Controller action
##### Refresh Token
##### Expiration date for token => default 2.weeks
##### Phone verification using twilio



## Installation
```ruby
gem 'rails_jwt_api', github: "https://github.com/Ispirett/rails_jwt"
or 
gem 'rails_jwt_api'
```
then execute:
```bash
$ bundle
```
```bash
rails g rails_jwt_api:install
```
And then:

```bash
rails db:migrate
```
## Usage
* Use authorize_user! helper for authenticating user with token 
```ruby
:authorize_user!
```
```ruby
class TomController < ApplicationController
before_action :authorize_user!, only: %w(create update)
end 
```
* Use current_user to access the current logged in user
```ruby
class TomController < ApplicationController
  def create
    current_user.email 
  end
end 
```
## User model 
* This gem creates a user model and handle securing password with bcrypt.
* After running the gem's install command you will see the code below.
* The details method is important to the gem.
* You can add or remove attributes which will affect the response.

```ruby
def details
    as_json(only: [:id, :email,:created_at])
end
```

## Routes
* This gem adds routes to your routes file like so.
* Sign Up /rails_jwt_api/auth/sign_up
* Sign In /rails_jwt_api/auth/sign_in

```ruby
  mount RailsJwtApi::Engine => "/rails_jwt_api", as: :rails_jwt
```





## Making  requests
##### Sign Up

```html
rails_jwt_api/auth/sign_up
```

```json
{ "user":{ "email":"hit@gmail.com", "password": "foobar", "password_confirmation": "foobar"}}
```
##### Response
```json
{
    "status": "success",
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MzQxNzg2MDd9.eJmaV2_fP8P52LiI9tJx_UTI8nTPxepuADz6KYK_Pew",
    "user": {
        "id": 1,
        "email": "hit@gmail.com",
        "created_at": "2021-10-07T02:30:07.894Z",
    },
    "exp": "07 20 73 01:00"
}
```

## Sign In
```html
rails_jwt_api/auth/sign_in

```

```json
{ "user":{ "email":"hit@gmail.com", "password": "foobar"}}
```
##### Response
```json
{
    "status": "success",
    "user": {
        "id": 4,
        "email": "test@gmail.com",
        "created_at": "2021-10-07T17:20:28.592Z"
    },
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJleHAiOjE2MzM2Mjc2MjJ9.HjMN61WlujV9YYLZAQ3Xog53jbPTugwMrq0rxdNL_Qk",
    "exp": "07-21-73 06:52"
}
```

## Request with token
* Add token user "AuthToken": '.........' in  headers
```js
      const api_add_error = async (data) => {
        const token = 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2l.................'
          try {
              const response = await fetch('http://example.com/resource',{
                  method: 'POST',
                  headers: {
                      'Content-Type': 'application/json',
                      'AuthToken': token
                  },
                  body: JSON.stringify(data)
              });
              return  await response.json()
          }
          catch (e) {
                 console.log(e)
          }
      }
```

##Phone Verification
##### Phone verification sends a 5 digit number to the number of the user.
* To enable phone verification edit the rails_jwt_api.rb in the initializers folder.
  
```ruby
# Twilio configuration
  config.phone_verification = true # default: false
  # config.account_sid # default: Rails.application.credentials.dig(:twilio, :account_sid)
  # config.auth_token #  Rails.application.credentials.dig(:twilio, :auth_token)
  config.magic_number   # Rails.application.credentials.dig(:twilio, :magic_number)
  # config.verification_length = 5  # The length of the verification code
```
* Configure twilio configuration in you credentials file like so
```bash
EDITOR="code --wait" rails:credentials edit --environment development
*Note you can also use ENV instead by replacing the configs in the inintialzer file.
```
```yaml
twilio:
  account_sid: rerreqereqreqfdafdfd
  auth_token:  fdfadffdfjereqwrq
  magic_number: +2132545454
```

## Request and Response phone verification
* Sign Up
```url
    http://localhost:3000/rails_jwt_api/auth/sign_up
```
*POST
```json
{ "user":{ "phone": "18683292490","email":"le@gmail.com", 
  "password": "12345678", "password_confirmation": "12345678"}
}
```
* User receives code
```json
{
    "status": "success",
    "user": {
        "id": 1,
        "email": "boo@gmail.com",
        "created_at": "2021-10-13T19:49:25.178Z"
    },
    "msg": "Please verify phone number"}
```

* Verify Phone

```url
http://localhost:3000/rails_jwt_api/auth/verify_phone
```
*POST
```json
{"user_id":"32", "verification_number": "70840"}
```
* Return user and token
```json
    {
  "status": "success",
  "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNCwiZXhwIjoxNjM1MzY0MTE0fQ.D6NGW88tR6TlVz587Dbw9uFUHktX2HCFCtKCccb27i8",
  "user": {
    "id": 1,
    "email": "boo@gmail.com",
    "created_at": "2021-10-13T19:49:25.178Z"
  },
  "exp": "08 09 73 11:46"
}
```






## Contributing


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).