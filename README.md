# RailsJwtApi

## Work in progress
Simple jwt rails authentication

## Features
##### Sign Up
##### Sign in
##### Authenticate any Controller action
##### Refresh Token
##### Expiration date for token => default 1.month


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
rails g rails_jwt:install
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
* Sign Up /rails_jwt/auth/sign_up
* Sign In /rails_jwt/auth/sign_in

```ruby
  mount RailsJwt::Engine => "/rails_jwt", as: :rails_jwt
```





## Making  requests
##### Sign Up

```html
rails_jwt/auth/sign_up
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
rails_jwt/auth/sign_in

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


## Contributing


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).