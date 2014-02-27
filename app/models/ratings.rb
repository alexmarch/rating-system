class Ratings < ActiveRecord::Base
  belongs_to :movie
  
  def self.get_vote_average(movie_id)
    rating = self.all.where(:movie_id => movie_id).average("vote_average")
    return rating if rating && rating > 0
    return 0
  end

  def self.can_set_vote(movie_id, ip)
    rating = self.find_by :movie_id => movie_id, :ip => ip
    if rating
      return true
    end
    return false
  end
end
