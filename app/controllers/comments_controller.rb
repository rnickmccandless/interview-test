class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new comment_params

    if @comment.save
      flash[:success] = 'Successfully saved'
      render :create
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to :gallery, format: :js
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:success] = 'Successfully saved'
      redirect_to :gallery
    else
      flash[:error] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    if @comment.destroy
      flash[:success] = 'Successfully deleted'
    else
      flash[:error] = @comment.errors.full_messages
    end

    redirect_to :gallery
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :rating, :user_id, :photo_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
