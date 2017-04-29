class EventsController < ApplicationController

  def index
    @events = Event.all
  end


  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path, flash: {notice: 'Your event has been created'}
    else
      redirect_back(root_path, flash: {error: 'Your event could not be created'})
    end
  end


  def add_to_roster
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @roster = EventRoster.new(event: @event, user: @user)
    if @roster.save
      redirect_to events_path, flash: {notice: 'You have been added to the roster'}
    else
      redirect_to events_path, flash: {error: "#{@roster.errors.first[1]}"}
    end

  end

  def remove_from_roster
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    EventRoster.where(event: @event, user: @user).first.delete
    redirect_to events_path, flash: {notice: 'You have been added to the roster, Command Notified'}
  end

  private

  def event_params
    new = params.require(:event).permit!
    new.merge(user_id: current_user.id).merge(
        {
            start: DateTime.new(
                new['start(1i)'].to_i,
                new['start(2i)'].to_i,
                new['start(3i)'].to_i,
                new['start(4i)'].to_i,
                new['start(5i)'].to_i,
            ),
            end: DateTime.new(
                new['end(1i)'].to_i,
                new['end(2i)'].to_i,
                new['end(3i)'].to_i,
                new['end(4i)'].to_i,
                new['end(5i)'].to_i,
            ),
        }
    )
  end
end