RailsJwtApi.setup do |config|

  # Token Expiration date
  # ---------------------------
  # Token will expire on the date you set .
  config.token_expiration = 2.weeks.from_now  # Default

  # Token secret key
  # -------------------
  # This key will be used to sign all jwt tokens created
  config.token_secret_key = Rails.application.secret_key_base # Default

end