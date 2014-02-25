class TvsController < ApplicationController
  def show
    @movie = Tmdb::TV.detail(params[:id])
    @images = Tmdb::TV.images(params[:id])
    # @casts = Tmdb::TV.casts(params[:id])
    # @keywords = Tmdb::TV.keywords(params[:id])
  end
end
