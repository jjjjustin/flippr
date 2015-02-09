class StaticController < ApplicationController
  def home
    if logged_in?
      @flip = current_user.flips.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def feed
    microposts
  end

end
