require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actormovies}
    it {should have_many(:actors).through(:actormovies)}
  end

  before :each do
    @studio1 = Studio.create!(name: "Disney")
    @movie1 = @studio1.movies.create!(name: "Iron Man", creation_year: "2006", genre: "Superhero")

    @actor1 = @movie1.actors.create!(name: "Matt Holmes", age: 30)
    @actor2 = @movie1.actors.create!(name: "Zeke Clark", age: 26)
  end

  describe "model method sort_actors_by_age" do
    it "can sort actors by age" do

      expect(@movie1.sort_actors_by_age.first).to eq(@actor2)
      expect(@movie1.sort_actors_by_age.last).to eq(@actor1)
    end
  end

  describe "model method average_actor_age" do
    it "can calculate the average age of all actors in a movie" do

      expect(@movie1.average_actor_age).to eq(28)
    end
  end
end
