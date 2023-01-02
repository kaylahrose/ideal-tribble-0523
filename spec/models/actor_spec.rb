require 'rails_helper'

RSpec.describe Actor do
  describe 'associations' do
    it { should have_many :actor_movies }
    it { should have_many(:movies).through(:actor_movies) }
  end

  describe 'class methods' do
    describe '#ordered_ages' do
      it 'orders actors from youngest to oldest' do
        Actor.destroy_all
        james = Actor.create!(name: 'James Cameron', age: 74)
        andre = Actor.create!(name: 'Andre Botkin', age: 36)
        mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)

        expect(Actor.ordered_ages).to eq([mariah, andre, james])
      end
    end
  end
end
