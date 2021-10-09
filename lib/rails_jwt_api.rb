require "rails_jwt_api/version"
require 'Jwt'
require 'bcrypt'
require 'rails_jwt_api/controllers/authentication'
require 'rails_jwt_api/controllers/helpers'
require "rails_jwt_api/engine"
require 'rails'

module RailsJwtApi
  mattr_accessor :token_expiration, default: 1.month.from_now
  mattr_accessor :token_secret_key, default: -> {Rails.application.secret_key_base}

  module Controllers
    autoload :Authentication, 'rails_jwt_api/controllers/authentication'
    autoload :Helpers, 'rails_jwt_api/controllers/helpers'
  end

  def self.config
    yield_self
  end
end
