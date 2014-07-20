class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @title = @user.name 
  end
  
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, flash: {success: "Welcome to the sample app!"}
      return
    else
    end
    @title = "Sign up"
    render 'new'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
