class TwilioWhatsappMessenger
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def call
    account_sid = ENV['TwILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create(
      {
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: '+5521986041140',
        body: message
      }
    )
  end
end
