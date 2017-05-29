class SmsNotificationsController < ApplicationController

  def new
    @notification = SmsNotification.new
  end


  def create
    @notification = SmsNotification.new(sms_params)
    if @notification.save
      render :new
    end

  end

  private

  def sms_params
    params.require(:sms_notification).permit(:body)
  end


end