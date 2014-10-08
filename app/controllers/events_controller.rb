class EventsController < ApplicationController
  def index
  end

  def send_event
    EventMailer.event_mail.deliver and render nothing: true
  end

  def about
  end

  def show_conditions
  end

  def send_request
    @participant = Participant.new
  end
end
