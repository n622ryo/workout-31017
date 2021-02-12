class TrainingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_training, only: [:show, :edit, :update, :destroy]

  def index
    @trainings = Training.includes(:user).order("created_at DESC")
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
    @comment = Comment.new
    @comments = @training.comments
  end

  def edit
    redirect_to action: :index unless current_user == @training.user
  end

  def update
    if @training.update(training_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @training.destroy
    redirect_to root_path
  end

  private

  def training_params
    params.require(:training).permit(:title, :trainingtime_id, :part_id, :event).merge(user_id: current_user.id)
  end

  def set_training
    @training = Training.find(params[:id])
  end
end
