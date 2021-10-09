
require_relative "lib/rails_jwt/version"

Gem::Specification.new do |spec|
  spec.name        = "rails_JWT"
  spec.version     = RailsJwt::VERSION
  spec.authors     = ["ispirett"]
  spec.email       = ["ispirett@gmail.com"]
  spec.homepage    = "https://github.com/Ispirett/rails_jwt"
  spec.summary     = "Use jwt with rails no code"
  spec.description = "Integrate jwt in your application with a few simple steps"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ispirett/rails_jwt"
  spec.metadata["changelog_uri"] = "https://github.com/Ispirett/rails_jwt/CHANGELOG.md"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.1"


  spec.add_dependency 'jwt'
  spec.add_dependency 'bcrypt', '~> 3.1.16'
  spec.add_dependency 'rspec'

end