Rails.application.routes.draw do
  mount RailsJwt::Engine => "/rails_jwt"
end
