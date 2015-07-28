class Manage::EventsController < Manage::ApplicationController
  def edit
    @events = Event.all
    @event = Event.find(params[:id])
    @related_items = {}.tap{ |hash|
      @event.related_items.each do |item|
        hash["#{item.item_type}_#{item.item_id}"] = JSON.parse($redis.get "#{item.item_type}_#{item.item_id}")
      end
    }
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Информация сохранена"
      redirect_to edit_manage_event_path(@event)
    else
      render :edit
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :category, :related_link => [], :related_title => [], :related => [])
  end
end
