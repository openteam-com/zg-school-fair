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

  def edit
    @event = Event.find(params[:id])
    @related_items = {}.tap{ |hash|
      @event.related_items.each do |item|
        hash[item.item_id] = JSON.parse($redis.get item.item_id)
      end
    }
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to manage_events_path
    else
      render :edit
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
    params.require(:event).permit(:title, :when, :related_link => [], :related_title => [], :related => [])
  end
end
