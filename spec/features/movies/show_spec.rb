require 'rails_helper'

RSpec.describe 'the movies show page' do
  #   Story 2
  # Movie Show

  # As a user,
  # When I visit a movie's show page.
  # I see the movie's title, creation year, and genre,
  # and a list of all its actors from youngest to oldest.
  # And I see the average age of all of the movie's actors
  it 'lists movies title, creation year, and genre' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
    # castles = studio_1.movies.create!(title: 'Castles In The Sky', creation_year: 2003, genre: 'Animation')

    visit "/movies/#{spirited_away.id}"

    expect(page).to have_content(spirited_away.title)
    expect(page).to have_content(spirited_away.creation_year)
    expect(page).to have_content(spirited_away.genre)
  end

  it 'lists all actors from youngest to oldest' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
    james = Actor.create!(name: 'James Cameron', age: 74)
    andre = Actor.create!(name: 'Andre Botkin', age: 36)
    mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)

    ActorMovie.create!(actor_id: james.id, movie_id: spirited_away.id)
    ActorMovie.create!(actor_id: andre.id, movie_id: spirited_away.id)
    ActorMovie.create!(actor_id: mariah.id, movie_id: spirited_away.id)

    visit "movies/#{spirited_away.id}"

    expect(andre.name).to appear_before(james.name)
    expect(mariah.name).to appear_before(andre.name)
    expect(mariah.name).to appear_before(james.name)
    expect(james.name).to_not appear_before(andre.name)
  end

  it 'shows average age of all the movies actors' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
    james = Actor.create!(name: 'James Cameron', age: 74)
    andre = Actor.create!(name: 'Andre Botkin', age: 36)
    mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)

    ActorMovie.create!(actor_id: james.id, movie_id: spirited_away.id)
    ActorMovie.create!(actor_id: andre.id, movie_id: spirited_away.id)
    ActorMovie.create!(actor_id: mariah.id, movie_id: spirited_away.id)

    visit "movies/#{spirited_away.id}"

    expect(page).to have_content('47.67')
  end
  #   Story 3
  # Add an Actor to a Movie

  # As a user,
  # When I visit a movie show page,
  # I do not see any actors listed that are not part of the movie
  # And I see a form to add an actor to this movie
  # When I fill in the form with the ID of an actor that exists in the database
  # And I click submit
  # Then I am redirected back to that movie's show page
  # And I see the actor's name is now listed
  # (You do not have to test for a sad path, for example if the id submitted is not an existing actor)

  it 'adds actor to movie' do
    studio_1 = Studio.create!(name: 'Gibbly', location: 'Japan')
    spirited_away = studio_1.movies.create!(title: 'Spirited Away', creation_year: 1998, genre: 'Animation')
    james = Actor.create!(name: 'James Cameron', age: 74)
    andre = Actor.create!(name: 'Andre Botkin', age: 36)
    mariah = Actor.create!(name: 'Mariah Ahmed', age: 33)

    ActorMovie.create!(actor_id: james.id, movie_id: spirited_away.id)
    ActorMovie.create!(actor_id: andre.id, movie_id: spirited_away.id)

    visit "movies/#{spirited_away.id}"

    expect(page).to have_no_content(mariah.name)

    fill_in('Actor id', with: "#{mariah.id}")
    click_on 'Add Actor'

    expect(current_path).to eq("/movies/#{spirited_away.id}")
    expect(page).to have_content(mariah.name)
  end
end
