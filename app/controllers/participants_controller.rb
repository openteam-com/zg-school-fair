class ParticipantsController < ApplicationController
  helper_method :filter_link

  def index
    @participants = Participant.send(order_by)
  end

  protected

  def filter_link
    Participant.nomination.values
  end

  def order_by
    params[:order_by] || 'all'
  end
end
