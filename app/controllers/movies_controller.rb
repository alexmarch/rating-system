class MoviesController < ApplicationController
  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @images = Tmdb::Movie.images(params[:id])
    @trailers = Tmdb::Movie.trailers(params[:id])
    @similar_movies = Tmdb::Movie.similar_movies(params[:id]).first(4)
    @casts = Tmdb::Movie.casts(params[:id])
    @keywords = Tmdb::Movie.keywords(params[:id])
  end
end
