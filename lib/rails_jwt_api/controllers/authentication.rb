module RailsJwtApi
  module Controllers
    module Authentication

      SECRET_KEY =  ENV.fetch("RAILS_JWT_TOKEN",RailsJwtApi.token_secret_key)
      # TODO refactor to allow users to ad there own expiration date
      def encode(payout, exp = RailsJwtApi.token_expiration)
        payout[:exp] = exp.to_i
        JWT.encode(payout, SECRET_KEY)
    
      end
    
      def decode(token)
        decode = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decode
      end
    end 
  end
end