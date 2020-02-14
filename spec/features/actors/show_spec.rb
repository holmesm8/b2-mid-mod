require 'rails_helper'

RSpec.describe "studios index page", type: :feature do
  context "as a visitor" do
    it "can see all studios with the names of their movies listed" do
      studio1 = Studio.create!(name: "Disney")
      movie1 = studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      movie2 = studio1.movies.create!(name: "Spiderman", creation_year: "2017", genre: "Superhero")

      actor1 = movie1.actors.create!(name: "Matt Holmes", age: "30")
      actor2 = movie1.actors.create!(name: "Zeke Clark", age: "25")

      visit "/actors/#{actor1.id}"

      expect(page).to have_content(actor1.name)
      expect(page).to have_content(actor1.age)
      expect(page).to have_content(movie1.name)

      expect(page).to_not have_content(actor2.name)
      expect(page).to_not have_content(movie2.name)
    end
  end
end
