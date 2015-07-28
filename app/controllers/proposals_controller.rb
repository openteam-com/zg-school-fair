class ProposalsController < ApplicationController
  include SimpleCaptcha::ControllerHelpers

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      flash[:notice] = "Ваша заявка принята"
      redirect_to about_path
    else
      render :new
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :category, :phone, :participant_type, :space)
  end
end
