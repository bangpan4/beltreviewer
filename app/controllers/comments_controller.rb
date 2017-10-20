class CommentsController < ApplicationController
  def create
    @comments = Comment.new comment_params
    if @comments.save 
      redirect_to "/events/#{params[:event_id]}"
    else
      flash[:errors] = @comments.errors.full_messages
      redirect_to "/events/#{params[:event_id]}"
    end
  end

  private 
    def comment_params
      params.require(:comment).permit(:content, :event_id).merge(user: current_user)
    end
end
