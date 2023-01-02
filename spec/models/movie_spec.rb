require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many :actor_movies }
    it { should have_many(:actors).through(:actor_movies) }
  end

  describe 'instance methods' do
    describe '#ordered_actors' do
      it 'returns all actors sorted by age' do
        Studio.destroy_all
        Movie.destroy_all
        Actor.destroy_all

        studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
        spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
        james = Actor.create!(name: 'James Cameron', age: 74)
        andre = Actor.create!(name: 'Andre Botkin', age: 36)
        mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)
        ActorMovie.create!(actor_id: james.id, movie_id: spirited_away.id)
        ActorMovie.create!(actor_id: andre.id, movie_id: spirited_away.id)
        ActorMovie.create!(actor_id: mariah.id, movie_id: spirited_away.id)

        expect(spirited_away.ordered_actors).to eq([mariah, andre, james])
      end
    end

    describe '#actors_avg_age' do
      it 'returns the average age of a movies actors' do
        Studio.destroy_all
        Movie.destroy_all
        Actor.destroy_all

        studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
        spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
        james = Actor.create!(name: 'James Cameron', age: 74)
        andre = Actor.create!(name: 'Andre Botkin', age: 36)
        mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)
        ActorMovie.create!(actor_id: james.id, movie_id: spirited_away.id)
        ActorMovie.create!(actor_id: andre.id, movie_id: spirited_away.id)
        ActorMovie.create!(actor_id: mariah.id, movie_id: spirited_away.id)

        expect(spirited_away.actors_avg_age).to eq(47.67)
      end
    end
  end
end
