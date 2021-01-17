class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @trainings = @user.trainings
    @favorite_trainings = @user.favorite_trainings
  end

  def edit
    redirect_to root_path unless current_user.id == @user.id
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
  end
end

private

  def user_params
    params.require(:user).permit(:name, :target)
  end

  def set_user
    @user = User.find(params[:id])
  end
end