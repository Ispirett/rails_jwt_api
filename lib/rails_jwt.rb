require 'rails'
require "rails_jwt/version"
require "rails_jwt/engine"
require 'active_support/dependencies'

module RailsJwt
  module Controllers
    autoload :Helpers, 'rails_jwt/controllers/helpers'
  end
end
