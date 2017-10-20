class EventsController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    @events = Event.where(state: current_user.state)
    @other_events = Event.where.not(state: current_user.state)
  end

  def create
    @events = Event.new event_params
    @events.save 
    redirect_to "/events/new"
  end



  def show
    @events = Event.find(params[:id])
    @comments = Comment.where(event_id: params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy if current_user = @event.user 
    redirect_to "/events/new"

  end

  private 
    def event_params
      params.require(:event).permit(:name, :date, :city, :state).merge(user: current_user)
    end

end
