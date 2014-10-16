class Manage::ParticipantsController < Manage::ApplicationController
  def index
    @participants = Participant.all
  end

  def destroy
    Participant.find(params[:id]).destroy
   redirect_to manage_participants_path
  end
end
