class Manage::ProposalsController < Manage::ApplicationController
  def index
    @proposals = Proposal.all
  end
end
