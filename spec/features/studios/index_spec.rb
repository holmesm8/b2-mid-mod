require 'rails_helper'

RSpec.describe "studios index page", type: :feature do
  context "as a visitor" do
    it "can see all studios with the names of their movies listed" do
      studio1 = Studio.create!(name: "Disney")
      studio2 = Studio.create!(name: "Sony")

      movie1 = studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      movie2 = studio2.movies.create!(name: "Spiderman", creation_year: "2017", genre: "Superhero")
      movie3 = studio1.movies.create!(name: "Toy Story", creation_year: "1994", genre: "Animated")

      visit '/studios'

      within ("#studio-#{studio1.name}") do
        expect(page).to have_content("#{movie1.name}")
        expect(page).to have_content("#{movie3.name}")
      end

      within ("#studio-#{studio1.name}") do
        expect(page).to have_content("#{movie2.name}")
      end
    end
  end
end
