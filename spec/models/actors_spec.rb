require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'relationships' do
    it {should have_many :actormovies}
    it {should have_many(:movies).through(:actormovies)}
  end

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

  describe "model method costars" do
    it "can list all of an actor's costars across all movies" do
      costars = @actor1.costars

      expect(costars).to eq(@actor2.name)
    end
  end
end
