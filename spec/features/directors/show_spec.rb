require 'rails_helper'

RSpec.describe 'the directors show page' do
  @director_1 = Director.create!(name: "bob",age: 5, alive:true)
  @movie_1 = @director_1.movies.create!(name: "bobs movie", length: 70, in_theaters: false)
  @movie_2 = @director_1.movies.create!(name: "bobs movie_2", length: 700, in_theaters: true)
  @movie_3 = @director_1.movies.create!(name: "bobs movie_3", length: 40, in_theaters: true)

  @director_2 = Director.create!(name: "sal",age: 90, alive:false)
  @movie_4 = @director_2.movies.create!(name: "sals movie", length: 70, in_theaters: true)
  @movie_5 = @director_2.movies.create!(name: "sals movie_2", length: 700, in_theaters: true)
  @movie_6 = @director_2.movies.create!(name: "sals movie_3", length: 40, in_theaters: false)

  it 'displays the directors and attributs' do
    visit '/directors/:id'
    expect(page).to have_content("bob")
    expect(page).to have_content(5)
    expect(page).to have_content(true)

    expect(page).to have_content("sal")
    expect(page).to have_content(90)
    expect(page).to have_content(false)
  end
end