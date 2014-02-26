class MainPageController < ApplicationController
  def index
    @client_ip = request.remote_ip
    @now_playing = Tmdb::Movie.now_playing.first(12)
    Ratings.get_vote_average(1234)
    @ratings = Ratings
    @popular_tv = Tmdb::TV.popular.first(9)
  end
end
