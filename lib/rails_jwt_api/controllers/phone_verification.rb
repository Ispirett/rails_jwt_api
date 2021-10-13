module RailsJwtApi
  module Controllers
    module PhoneVerification


      def send_message(body:, to: )

        account_sid = RailsJwtApi.account_sid.call # Your Test Account SID from www.twilio.com/console/settings
        auth_token = RailsJwtApi.auth_token.call   # Your Test Auth Token from www.twilio.com/console/settings

        @client = Twilio::REST::Client.new(account_sid, auth_token)
        message = @client.messages.create(
          body: body,
          to: to, # Replace with your phone number
          from: RailsJwtApi.magic_number.call)  # Use this Magic Number for creating SMS
          puts message.sid
      end


      def generate_random_number
        Array.new(RailsJwtApi.verification_length) {rand(0..9)}.join('')
      end


    end
  end
end