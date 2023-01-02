require 'rails_helper'

RSpec.describe 'the studios index' do
  #   Story 1
  # Studio Index

  # As a user,
  # When I visit the studio index page,
  # Then I see all of the studios including name and location,
  # And under each studio I see all of the studio's movies
  # including the movie's title, creation year, and genre

  it 'lists each studios name and location' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    studio_2 = Studio.create!(name: 'Alpha', location: 'South Africa')
    studio_3 = Studio.create!(name: 'Beta', location: 'Canada')

    visit '/studios'

    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(studio_2.location)
    expect(page).to have_content(studio_3.name)
    expect(page).to have_content(studio_3.location)
  end

  it 'lists all stuidos movies under the studio including title, creation, year, and genre' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    studio_2 = Studio.create!(name: 'Alpha', location: 'South Africa')
    studio_3 = Studio.create!(name: 'Beta', location: 'Canada')

    spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
    castles = studio_1.movies.create!(title: 'Castles In The Sky', creation_year: 2003, genre: 'Animation')
    runner = studio_2.movies.create!(title: 'Runner', creation_year: 2005, genre: 'Thriller')

    visit '/studios'

    within("#studio-#{studio_1.id}") do
      expect(page).to have_content(spirited_away.title)
      expect(page).to have_content(spirited_away.creation_year)
      expect(page).to have_content(spirited_away.genre)
      expect(page).to have_content(castles.title)
      expect(page).to have_content(castles.creation_year)
      expect(page).to have_content(castles.genre)
      expect(page).to have_no_content(runner.genre)
    end
  end
end
