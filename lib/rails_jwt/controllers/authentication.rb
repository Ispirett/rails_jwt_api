module RailsJwt
  module Controllers
    module Authentication

      SECRET_KEY =  ENV.fetch("RAILS_JWT_TOKEN", 'development')
      # TODO refactor to allow users to ad there own expiration date
      def encode(payout, exp = 1.month.from_now)
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