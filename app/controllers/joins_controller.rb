class JoinsController < ApplicationController
  def create
    Join.create join_params
    redirect_to "/events/new"
  end

  def destroy
    @join = Join.find(params[:id])
    @join.destroy if current_user = @join.user 
    redirect_to "/events/new"
  end

  private 
    def join_params
      params.require(:join).permit(:event_id).merge(user: current_user)
    end
end
