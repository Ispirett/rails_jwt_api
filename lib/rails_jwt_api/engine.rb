module RailsJwtApi
  class Engine < ::Rails::Engine
    isolate_namespace RailsJwtApi

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
      g.template_engine false
    end
    ActionController::Base.send :include, RailsJwtApi::Controllers::Helpers
  end
end
