require 'rails_helper'

RSpec.describe "studios index page", type: :feature do
  context "as a visitor" do
    before :each do
      @studio1 = Studio.create!(name: "Disney")
      @studio2 = Studio.create!(name: "Sony")

      @movie1 = @studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")
      @movie2 = @studio2.movies.create!(name: "Spiderman", creation_year: "2017", genre: "Superhero")
      @movie3 = @studio1.movies.create!(name: "Toy Story", creation_year: "1994", genre: "Animated")
    end

    it "can see all studios with the names of their movies listed" do

      visit '/studios'

      within ("#studio-#{@studio1.id}") do
        expect(page).to have_content("#{@studio1.name}")
        expect(page).to have_content("#{@movie1.name}")
        expect(page).to have_content("#{@movie3.name}")
      end

      within ("#studio-#{@studio2.id}") do
        expect(page).to have_content("#{@studio2.name}")
        expect(page).to have_content("#{@movie2.name}")
      end
    end
  end
end
