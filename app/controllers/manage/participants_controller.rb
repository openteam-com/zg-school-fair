class Manage::ParticipantsController < Manage::ApplicationController
  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to manage_participants_path
    else
      render :new
    end
  end

  def edit
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(participant_params)
      redirect_to manage_participants_path
    else
      render :edit
    end
  end

  def destroy
    Participant.find(params[:id]).destroy
    redirect_to manage_participants_path
  end

  private

  def participant_params
    params.require(:participant).permit(:full_name, :description, :image, :nomination => [])
  end
end
