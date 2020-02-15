require 'rails_helper'

RSpec.describe "movie show page", type: :feature do
  describe "when a visitor goes to the movie's show page" do
    before :each do
      @studio1 = Studio.create!(name: "Disney")
      @movie1 = @studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")

      @actor1 = @movie1.actors.create!(name: "Matt Holmes", age: 30)
      @actor2 = @movie1.actors.create!(name: "Zeke Clark", age: 26)
    end

    it "can see movie name, creation year, and genre as well as actors listed by age
    and the average age of the actors" do

      visit "movies/#{@movie1.id}"

      expect(page).to have_content(@movie1.name)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)

      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor2.name)
      expect(page).to have_content("Average Age: 28")
    end
  end
end


# Story 3
# As a user,
# When I visit a movie's show page.
# I see the movie's name, creation year, and genre,
# and a list of all its actors from youngest to oldest.
# And I see the average age of all of the movie's actors
