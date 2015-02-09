class FlipsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @flip = current_user.flips.build(flip_params)
    if @flip.save
      flash[:success] = "New Flip created"
      redirect_to root_url
    else
      @feed_items = [...]
      render 'static/home'
    end
  end

  def index
    @flips = Flip.all

  def destroy
    @flip.delete
    flash[:success] = "Flip has been deleted"
    redirect_to request.referrer || root_url
  end

  private
    def flip_params
      params.require(:flip).permit(:content)
    end

    def correct_user
      @flip = current_user.flips.find_by(id: params[:id])
      redirect_to root_url if @flip.nil?
    end

end
