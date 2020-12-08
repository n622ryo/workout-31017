class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def new
    @training = Training.new
  end

  def create
    @training = Training.new(training_params)
    if @training.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def training_params
    params.require(:training).permit(:title, :trainingtime_id, :part_id, :event).merge(user_id: current_user.id)
  end
end
