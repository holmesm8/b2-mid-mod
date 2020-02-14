require 'rails_helper'

RSpec.describe "studios index page", type: :feature do
  context "as a visitor" do
    it "can see all studios with the names of their movies listed" do
      studio1 = Studio.create!(name: "Disney")

      actor1 = Actor.create!(name: "Matt Holmes", age: "30")
      actor2 = Actor.create!(name: "Zeke Clark", age: "25")

      movie1 = actor1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      movie2 = actor1.movies.create!(name: "Spiderman", creation_year: "2017", genre: "Superhero")
      movie3 = actor2.movies.create!(name: "Toy Story", creation_year: "1994", genre: "Animated")

      visit "/actors/#{actor1.id}"

      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor1.age)
      expect(page).to have_content(movie1.name)
      expect(page).to have_content(movie2.name)

      expect(page).to_not have_content(actor2.name)
      expect(page).to_not have_content(movie3.name)
    end
  end
end


# Story 2
# As a user,
# When I visit an actor's show page,
# I see their name, their age, and a list of the names of all of the movies they are in.
