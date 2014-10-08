class ParticipantsController < ApplicationController
  def new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to about_path
    else
      redirect_to send_request_path
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:performer, :age, :address, :phone, :email, :performance_name,
                                        :music, :accept_terms, :nomination => [], :auditory => [])
  end
end
