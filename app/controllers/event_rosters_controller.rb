class EventRostersController < ApplicationController

  def create
    @roster = EventRoster.new(roster_params)

    if @roster.save
      redirect_to events_path, flash: {notice: 'You have been added to the roster'}
    else
      redirect_to events_path, flash: {error: "#{@roster.errors.first[1]}"}
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    EventRoster.where(event: @event, user: @user).first.delete

    redirect_to events_path, flash: {notice: 'You have been added to the roster, Command Notified'}
  end

  private

  def roster_params
    params.permit(:user_id, :event_id)
  end

end