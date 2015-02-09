class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)
    if user.user_name
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
