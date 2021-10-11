RailsJwtApi.setup do |config|

  # Token Expiration date
  # ---------------------------
  # Token will expire on the date you set .
  config.token_expiration = 2.weeks.from_now  # Default

  # Token secret key
  # -------------------
  # This key will be used to sign all jwt tokens created
  # config.token_secret_key  # development



  # Twilio configuration

  # config.phone_verification = true  # default: false
  # config.account_sid # default: Rails.application.credentials.dig(:twilio, :account_sid)
  # config.auth_token #  Rails.application.credentials.dig(:twilio, :auth_token)
  # config.magic_number = '' # Rails.application.credentials.dig(:twilio, :magic_number)
  # config.verification_length = 5  # The length of the verification code

end