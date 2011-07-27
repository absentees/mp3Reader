class FeedsController < ApplicationController
  before_filter :authenticate_user

  def create
   @feed = current_user.feed.build(params[:feed])
    if @feed.save
      flash[:success] = "Feed Created"
      redirect_to root_path
    end
  end
end
