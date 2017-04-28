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


# {
#     start: DateTime.new(
#         params['start(1i)'].to_i,
#         params['start(2i)'].to_i,
#         params['start(3i)'].to_i,
#         params['start(4i)'].to_i,
#         params['start(5i)'].to_i,
#     ),
#     end: DateTime.new(
#         params['end(1i)'].to_i,
#         params['end(2i)'].to_i,
#         params['end(3i)'].to_i,
#         params['end(4i)'].to_i,
#         params['end(5i)'].to_i,
#     ),
# }
# civil(year, month, day, hour, min, sec, offset)

# Parameters {
#   "start(3i)" => "27",
#       "start(2i)" => "4",
#       "start(1i)" => "2017",
#       "start(4i)" => "20",
#       "start(5i)" => "17",
#       "end(3i)" => "27",
#       "end(2i)" => "4",
#       "end(1i)" => "2017",
#       "end(4i)" => "20",
#       "end(5i)" => "17",
#       "total_needed" => "2"}
