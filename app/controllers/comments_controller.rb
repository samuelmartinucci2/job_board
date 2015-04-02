class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.job = Job.find(params[:job_id])

    if success = @comment.save
      CompanyMailer.new_comment(@comment.job, @comment).deliver_now
    end

    respond_to do |format|
      format.html do
        if success
          flash[:notice] = "Comment was created with success!"
        else
          flash[:alert] = "Please fill in all fields to create a comment."
        end
        redirect_to @comment.job
      end
      format.js
    end



  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end