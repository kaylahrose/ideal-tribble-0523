class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies, dependent: :destroy

  def ordered_actors
    actors.order(:age)
  end

  def actors_avg_age
    if actors.average(:age)
      actors.average(:age).round(2)
    else
      0
    end
  end
end
