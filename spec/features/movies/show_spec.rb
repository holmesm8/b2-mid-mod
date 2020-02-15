require 'rails_helper'

RSpec.describe "movie show page", type: :feature do
  describe "when a visitor goes to the movie's show page" do
    before :each do
      @studio1 = Studio.create!(name: "Disney")
      @movie1 = @studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      @movie2 = @studio1.movies.create!(name: "Spiderman", creation_year: "2006", genre: "Superhero")

      @actor1 = @movie1.actors.create!(name: "Matt Holmes", age: 30)
      @actor2 = @movie1.actors.create!(name: "Zeke Clark", age: 26)
      @actor3 = @movie2.actors.create!(name: "Meghan Stovall", age: 3)
    end

    it "can see movie name, creation year, and genre as well as actors listed by age
    and the average age of the actors" do

      visit "/movies/#{@movie1.id}"

      expect(page).to have_content(@movie1.name)
      expect(page).to have_content(@movie1.creation_year)
      expect(page).to have_content(@movie1.genre)

      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor2.name)
      expect(page).to have_content("Average Age: 28")
    end

    it "can see a form for an actors name " do

      visit "movies/#{@movie1.id}"
      fill_in :name, with: "#{@actor3.name}"
      click_on "Add Actor"

      expect(current_path).to eq("/movies/#{@movie1.id}")
      expect(page).to have_content("#{@actor3.name}")
      expect(page).to have_content("Average Age: 20")
    end
  end
end
