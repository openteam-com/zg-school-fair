class ProposalsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if simple_captcha_valid?
      if @proposal.save
        flash[:notice] = "Ваша заявка принята"
        EventMailer.delay.event_mail(@proposal)
        redirect_to about_path
      else
        render :new
      end
    else
      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:performer, :age, :address, :phone, :email, :performance_name,
                                        :music, :accept_terms, :nomination => [], :auditory => [])
  end
end
