class MainPageController < ApplicationController
  def index
    @now_playing = Tmdb::Movie.now_playing.first(12)
    @popular_tv = Tmdb::TV.popular.first(9)
  end
end
