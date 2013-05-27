class UsersController < ApplicationController
  def lookup
    username = (params[:username] || '').strip.delete('@')
    redirect_to user_path(username)
  end

  def index
  end

  def show
    @username = params[:id]
    @tweets   = Twitter.user_timeline(@username, :count => 200, :include_rts => false, :trim_user => true)

    generator = TwoChainz::Generator.new

    shortest = 140
    longest  = 0

    @tweets.each do |tweet|
      text = tweet.text
      generator.hear(text)

      # Record counts
      shortest = text.length if text.length < shortest
      longest  = text.length if text.length > longest
    end

    @potential_tweet = generator.spit(
      :max_chars => longest,
      :min_chars => shortest
    )
  end
end
