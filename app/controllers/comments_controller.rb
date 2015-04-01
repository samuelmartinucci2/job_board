class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.job = Job.find(params[:job_id])
    if @comment.save
      flash[:notice] = "Comment was created with success!"
    else
      flash[:alert] = "Please fill in all fields to create a comment."
    end

    redirect_to @comment.job
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end