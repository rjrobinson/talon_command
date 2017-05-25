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

  def update
    @event_roster = EventRoster.find(params[:event_roster_id])
    if @event_roster.update(roster_params)
      redirect_to event_path(@event_roster.event_id), flash: {notice: 'Roster Updated'}
    else
      redirect_to event_path(@event_roster.event_id), flash: {danger: 'Unable to update', }
    end
  end

  private

  def roster_params
    status = params[:status] || 'pending'
    params.permit(:user_id, :event_id, :status).merge(status: status, approved_by: current_user.id)
  end

end