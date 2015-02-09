class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Flippr!"
      redirect_to @user
    else
      render 'new'
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :photo_url, :bio, :location)
    end

end
