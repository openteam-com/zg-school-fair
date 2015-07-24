class EventsController < ApplicationController
  include EventsHelper

  def index
    @related_items = related(Event.find(params[:event_id]))
  end
end
