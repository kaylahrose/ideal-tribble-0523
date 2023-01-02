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

        expect(spirited_away.ordered_actors).to eq([mariah, andre, james])
      end
    end
  end
end
