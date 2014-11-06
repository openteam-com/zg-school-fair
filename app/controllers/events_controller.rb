class EventsController < ApplicationController
  include EventsHelper

  def index
    @related_items = related(Event.last)
  end

  def send_event
    EventMailer.event_mail.deliver and render nothing: true
  end

  def about
  end

  def show_conditions
  end

end
