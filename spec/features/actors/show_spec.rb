require 'rails_helper'

RSpec.describe "actors show page", type: :feature do
  context "as a visitor" do
    before :each do
      @studio1 = Studio.create!(name: "Disney")
      @movie1 = @studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      @movie2 = @studio1.movies.create!(name: "Cats", creation_year: "2017", genre: "Superhero")

      @actor1 = @movie1.actors.create!(name: "Matt Holmes", age: 30)
      @actor2 = @movie1.actors.create!(name: "Zeke Clark", age: 26)
      @actor3 = @movie1.actors.create!(name: "Meghan Stovall", age: 3)
      @actor4 = @movie1.actors.create!(name: "Katgleen Carrol", age: 25)
      @actor5 = @movie1.actors.create!(name: "Ryan Allen", age: 57)
    end

    it "can see all studios with the names of their movies listed" do

      visit "/actors/#{@actor1.id}"

      expect(page).to have_content(@actor1.name)
      expect(page).to have_content(@actor1.age)
      expect(page).to have_content(@movie1.name)

      expect(page).to_not have_content(@actor5.name)
      expect(page).to_not have_content(@movie2.name)
    end

    it "can see all of the actors this actor has worked with" do

      visit "/actors/#{@actor1.id}"

      expect(page).to have_content(@actor2.name)
      expect(page).to have_content(@actor3.name)
      expect(page).to have_content(@actor4.name)

      expect(page).to_not have_content(@actor5.name)
      expect(page).to_not have_content(@movie2.name)
    end
  end
end


# Story 5
# As a user,
# When I visit an actor's show page
# I see a unique list of all of the actors this particular actor has worked with.
