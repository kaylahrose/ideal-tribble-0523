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
    studio_1 = Studio.create(name: "Gibbly", location: "Japan")
    studio_2 = Studio.create(name: "Alpha", location: "South Africa")
    studio_3 = Studio.create(name: "Beta", location: "Canada")

    visit '/studios'

    expect(page).to have_content(studio_1.name)
    expect(page).to have_content(studio_1.location)
    expect(page).to have_content(studio_2.name)
    expect(page).to have_content(studio_2.location)
    expect(page).to have_content(studio_3.name)
    expect(page).to have_content(studio_3.location)
  end
  
  it 'lists all stuidos movies under the studio including title, creation, year, and genre'
end
