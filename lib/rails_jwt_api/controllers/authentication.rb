module RailsJwtApi
  module Controllers
    module Authentication
      def encode(payout, exp = RailsJwtApi.token_expiration)
        payout[:exp] = exp.to_i
        JWT.encode(payout, RailsJwtApi.token_secret_key)
      end
    
      def decode(token)
        decode = JWT.decode(token,RailsJwtApi.token_secret_key)[0]
        HashWithIndifferentAccess.new decode
      end
    end 
  end
end