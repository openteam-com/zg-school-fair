class Manage::ParticipantsController < Manage::ApplicationController
  def index
    @participants = Participant.all
  end
end
