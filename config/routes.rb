RailsJwtApi::Engine.routes.draw do
  match '/auth/sign_in' => "users#sign_in", via: :get, as: :sign_in
  match '/auth/sign_up' => "users#create", via: :post, as: :sign_up
  match '/auth/verify_phone' => "users#verify_phone", via: :post, as: :verify_phone
end
