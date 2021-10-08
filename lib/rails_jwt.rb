require "rails_jwt/version"
require 'Jwt'
require 'bcrypt'
require 'rails_jwt/controllers/authentication'
require 'rails_jwt/controllers/helpers'
require "rails_jwt/engine"

module RailsJwt
  module Controllers
    autoload :Authentication, 'rails_jwt/controllers/authentication'
    autoload :Helpers, 'rails_jwt/controllers/helpers'
  end
end
