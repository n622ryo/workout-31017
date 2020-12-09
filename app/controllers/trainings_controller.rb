class TrainingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @training = Training.find(params[:id])
  end

  def edit
    @training = Training.find(params[:id])
    unless current_user == @training.user
      redirect_to action: :index
    end
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private
  def training_params
    params.require(:training).permit(:title, :trainingtime_id, :part_id, :event).merge(user_id: current_user.id)
  end
end