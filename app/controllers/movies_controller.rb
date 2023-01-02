class MoviesController < ApplicationController
  def index
  end
  
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.ordered_actors
    @actors_avg_age = @movie.actors_avg_age
  end
end