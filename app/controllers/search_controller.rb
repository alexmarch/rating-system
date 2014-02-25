class SearchController < ApplicationController
  def result
    @search = Tmdb::Movie.find(params[:q])
  end
end
