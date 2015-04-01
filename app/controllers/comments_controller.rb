class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.job = Job.find(params[:job_id])
    @comment.save

    redirect_to @comment.job
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end