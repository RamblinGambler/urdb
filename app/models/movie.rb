class Movie < ActiveRecord::Base
  has_many :showtimes
  has_many :roles
  has_many :stars, through: :roles

  def rotten_finder
    RottenMovie.find(title: title, limit: 1)
  end

  def audience_rating
    return nil if rotten_finder.empty?
    rotten_finder.ratings.audience_score
  end

  def snippet
    description.to_s.truncate 50
  end
end
