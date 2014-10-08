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
    params.require(:participant).permit(:performance_name, :nomination, :auditory, :age, :address_index,
                                        :address_area, :address_district, :address_city, :address_street,
                                        :address_building, :address_housing, :address_flat,:phone, :email,
                                        :performance_name, :music, :accept_terms)
  end
end
