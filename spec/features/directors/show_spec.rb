require 'rails_helper'

RSpec.describe 'the directors show page' do
  before :each do 
  @director_1 = Director.create!(name: "bob",age: 5, alive:true)
  @movie_1 = @director_1.movies.create!(name: "bobs movie", length: 70, in_theaters: false)
  @movie_2 = @director_1.movies.create!(name: "bobs movie_2", length: 700, in_theaters: true)
  @movie_3 = @director_1.movies.create!(name: "bobs movie_3", length: 40, in_theaters: true)

  @director_2 = Director.create!(name: "sal",age: 90, alive:false)
  @movie_4 = @director_2.movies.create!(name: "sals movie", length: 70, in_theaters: true)
  @movie_5 = @director_2.movies.create!(name: "sals movie_2", length: 700, in_theaters: true)
  @movie_6 = @director_2.movies.create!(name: "sals movie_3", length: 40, in_theaters: false)

  @director_3 = Director.create!(name: "dan",age: 25, alive:true)
  @movie_7 = @director_3.movies.create!(name: "dans movie", length: 43, in_theaters: true)
  @movie_8 = @director_3.movies.create!(name: "dans movie_2", length: 66, in_theaters: true)
  @movie_9 = @director_3.movies.create!(name: "dans movie_3", length: 44, in_theaters: false)
  @movie_10 = @director_3.movies.create!(name: "dans movie_4", length: 86, in_theaters: false)
  end
  it 'displays the directors and attributs' do
    visit "/directors/#{@director_1.id}"
    expect(page).to have_content("bob")
    expect(page).to have_content(5)
    expect(page).to have_content(true)

    expect(page).to_not have_content("sal")
    expect(page).to_not have_content(90)
    expect(page).to_not have_content(false)
  end


  # User Story 7, Parent Child Count

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

  it "displays count of all movies" do
    visit "/directors/#{@director_1.id}"

    expect(page).to have_content("Movie Count: 3")

    visit "/directors/#{@director_3.id}"

    expect(page).to have_content("Movie Count: 4")
  end
end