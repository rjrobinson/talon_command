class SMSNotification
  @client ||= Twilio::REST::Client.new


  def send_notifcation
    @client.messages.create(
        from: '17328448638',
        to: '19085666628‬',
        body: 'TALON COMMAND ONLINE'
    )
  end
end