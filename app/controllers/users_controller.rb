class UsersController < ApplicationController
  def lookup
    username = (params[:username] || '').strip.delete('@')
    redirect_to user_path(username)
  end

  def index
  end

  def show
    @username = params[:id]
    @tweets   = Twitter.user_timeline(@username)
  end
end
