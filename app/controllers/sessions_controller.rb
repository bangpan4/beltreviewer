class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      redirect_to "/events/new"
    else 
      flash[:errors] = ["Invalid input"]
      redirect_to "/users" 
    end
  end

  def destroy
    reset_session
    redirect_to "/users"
  end

  
end
