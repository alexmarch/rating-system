class RatingsController < ApplicationController
  respond_to :json

  def score

    if !Ratings.can_set_vote(params[:id], request.remote_ip)
      
      @rating = Ratings.find_or_create_by(:movie_id => params[:id])
      @rating.vote_average = @rating.vote_average || 0 + params[:score].to_f
      @rating.ip = request.remote_ip
      @rating.save
      
      render json: @rating.as_json(only: [:vote_average])
    
    end
  end

  private
  def score_params
    params.require(:id)
  end
end
