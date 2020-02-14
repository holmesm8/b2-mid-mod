require 'rails_helper'

RSpec.describe "studios index page", type: :feature do
  context "as a visitor" do
    it "can see all studios with the names of their movies listed" do
      studio1 = Studio.create!(name: "Disney")
      studio2 = Studio.create!(name: "Sony")

      movie1 = studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      movie2 = studio2.movies.create!(name: "Spiderman", creation_year: "2017", genre: "Superhero")

      visit '/studios'

      expect(page).to have_content("#{studio1.name}")
      expect(page).to have_content("#{movie1.name}")
      expect(page).to have_content("#{studio2.name}")
      expect(page).to have_content("#{movie2.name}")
    end
  end
end
