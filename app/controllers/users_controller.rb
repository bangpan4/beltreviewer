class UsersController < ApplicationController
  def index

  end

  def create
    @user = User.new user_params
    if @user.save 
      session[:user_id] = @user.id
      redirect_to "/events/new"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_params) 
      redirect_to "/events/new"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/#{@user.id}/edit"
    end  
  end

  def edit
    @user = User.find(params[:id])
  end

  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end

    def update_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state)
    end
end
