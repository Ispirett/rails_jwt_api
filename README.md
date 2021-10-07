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
{ "user":{ "email":"hit@gmail.com", "password": "foobar"}}
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
        "updated_at": "2021-10-07T02:30:07.894Z"
    },
    "exp": "07 20 73 01:00"
}
```

## Sign In
```html
rails_jwt/auth/sign_up

```
eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2MzQxNzg2MDd9.eJmaV2_fP8P52LiI9tJx_UTI8nTPxepuADz6KYK_Pew



## Contributing


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).