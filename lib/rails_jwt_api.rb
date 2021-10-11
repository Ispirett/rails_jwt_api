require "rails_jwt_api/version"
require 'Jwt'
require 'bcrypt'
require 'rails'
require 'twilio-ruby'
require 'phonelib'
require 'rails_jwt_api/controllers/authentication'
require 'rails_jwt_api/controllers/helpers'
require 'rails_jwt_api/controllers/phone_verification'
require "rails_jwt_api/engine"


module RailsJwtApi
  mattr_accessor :token_expiration, default: 1.month.from_now
  mattr_accessor :token_secret_key, default: "development"

  #=> Twilio config
  mattr_accessor :phone_verification, default: false
  mattr_accessor :account_sid, default: ->{Rails.application.credentials.dig(:twilio, :account_sid)}
  mattr_accessor :auth_token, default:->{Rails.application.credentials.dig(:twilio, :auth_token)}
  mattr_accessor :magic_number, default:->{Rails.application.credentials.dig(:twilio, :magic_number)}
  mattr_accessor :verification_length, default: 5 #=> Example 45678 , the number the client receives

  module Controllers
    autoload :Authentication, 'rails_jwt_api/controllers/authentication'
    autoload :Helpers, 'rails_jwt_api/controllers/helpers'
  end

  def self.setup
    yield(self)
  end
end
