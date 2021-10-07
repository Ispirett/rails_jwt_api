# RailsJwt

## Work in progress
Simple jwt rails authentication

## Usage

## Installation
```ruby
gem 'rails_jwt', github: "https://github.com/Ispirett/rails_jwt"
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



## Contributing


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).