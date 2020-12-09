class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to training_path(@comment.training)
    else
      @training = @comment.training
      @comments = @training.comments
      render "trainings/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, training_id: params[:training_id])
  end
end
