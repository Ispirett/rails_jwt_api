Rails.application.routes.draw do
  mount RailsJwtApi::Engine => "/rails_jwt_api"
end
