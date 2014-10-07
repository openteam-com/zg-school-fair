class EventsController < ApplicationController
  def index
    @participant = Participant.new
  end

  def send_event
    EventMailer.event_mail.deliver and render nothing: true
  end
end
