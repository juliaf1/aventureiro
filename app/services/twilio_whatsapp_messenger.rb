class TwilioWhatsappMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  # when making this feature live, remember to send user argument with to: tel number
  def send_whatsapp
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
      {
        from: 'whatsapp:+14155238886',
        to: 'whatsapp:+5521986041140',
        body: message
      }
    )
  end
end
