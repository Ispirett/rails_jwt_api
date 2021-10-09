require "rails_jwt_api/version"
require 'Jwt'
require 'bcrypt'
require 'rails_jwt_api/controllers/authentication'
require 'rails_jwt_api/controllers/helpers'
require "rails_jwt_api/engine"

module RailsJwtApi
  module Controllers
    autoload :Authentication, 'rails_jwt_api/controllers/authentication'
    autoload :Helpers, 'rails_jwt_api/controllers/helpers'
  end
end
