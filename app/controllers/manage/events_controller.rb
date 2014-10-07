class Manage::EventsController < Manage::ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to manage_events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to manage_events_path
  end

  private
  def event_params
    params.require(:event).permit(:title, :when)
  end
end
