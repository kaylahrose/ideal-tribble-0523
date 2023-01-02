class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, :through => :actor_movies, dependent: :destroy

  def ordered_actors
    actors.order(:age)
  end
end
