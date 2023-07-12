require 'rails_helper'

RSpec.describe 'the directors index page' do

  before do
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
  end

# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
  it 'displays the directors' do
    visit '/directors'

    expect(page).to have_content("bob")

    expect(page).to have_content("sal")
 
  end

#   User Story 6, Parent Index sorted by Most Recently Created 
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

  it "should include dates that farm records were created" do
    visit "/directors"

    expect(page).to have_content("Date Posted: #{@director_1.created_at}")
    expect(page).to have_content("Date Posted: #{@director_2.created_at}")
    expect(page).to have_content("Date Posted: #{@director_3.created_at}")
  end

  it 'list directors in order of recently created' do
    visit '/directors'
    
    expect(page.all(".director")[0]).to have_content("dan")
    expect(page.all(".director")[1]).to have_content("sal")
    expect(page.all(".director")[2]).to have_content("bob")
    
  end

end

