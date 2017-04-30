class EventRostersController < ApplicationController

  def create
    @roster = EventRoster.new(roster_params)

    if @roster.save
      redirect_to events_path, flash: {notice: 'Your request has been submitted to be added'}
    else
      redirect_to events_path, flash: {error: "#{@roster.errors.first[1]}"}
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    EventRoster.where(event: @event, user: @user).first.delete

    redirect_to events_path, flash: {error: 'Your request has been submitted for removal'}
  end

  private

  def roster_params
    params.permit(:user_id, :event_id).merge(status: 'pending')
  end

end