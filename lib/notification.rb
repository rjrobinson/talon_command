class SMSNotification
  require 'twilio-ruby'


  Twilio.configure do |config|
    config.account_sid = account_sid
    config.auth_token = auth_token
  end

  def initialize
    @client = Twilio::REST::Client.new
  end


  def send_notifcation(notification)
    @client.messages.create(
        from: notification.from,
        to: notification.to,
        body: notification.body
    )
  end
end