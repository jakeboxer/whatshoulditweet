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

    generator = TwoChainz::Generator.new(:boring => true)

    # Hear all the tweets
    @tweets.each {|tweet| generator.hear(tweet.text) }

    @potential_tweet = generator.spit(:max_chars => 140)
  end
end
