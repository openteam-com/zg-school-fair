class ParticipantsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if simple_captcha_valid?
      if @participant.save
        flash[:notice] = "Ваша заявка принята"
        redirect_to about_path
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:performer, :age, :address, :phone, :email, :performance_name,
                                        :music, :accept_terms, :nomination => [], :auditory => [])
  end
end
