class Manage::ProposalsController < Manage::ApplicationController
  def index
    @proposals = Proposal.all
  end

  def destroy
    Proposal.find(params[:id]).destroy
   redirect_to manage_proposals_path
  end
end
