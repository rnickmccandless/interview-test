class CommentsController < ApplicationController
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
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:success] = 'Successfully saved'
      redirect_to :gallery
    else
      flash[:error] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

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
end
