class ParticipantsController < ApplicationController
  def new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:first_name, :last_name, :address, :accept_terms)
  end
end
