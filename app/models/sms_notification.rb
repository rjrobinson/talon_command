class SmsNotification < ApplicationRecord


  PHONE_NUMBER = '+17328448638'

  @client ||= Twilio::REST::Client.new


  def send_to_all

  end


  def send_notification
    @client = Twilio::REST::Client.new
    @client.messages.create(
        from: PHONE_NUMBER,
        to: to,
        body: body
    )
  end
end
