class ActorMoviesController < ApplicationController
  def create
    # require 'pry'; binding.pry
    ActorMovie.create(movie_id: params[:id], actor_id: params[:actor_identification])
    redirect_to "/movies/#{params[:id]}"
  end
end