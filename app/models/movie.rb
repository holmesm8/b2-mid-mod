class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre

  belongs_to :studio
  has_many :actormovies
  has_many :actors, through: :actormovies

  def sort_actors_by_age
    self.actors.order(:age)
  end

  def average_actor_age
    self.actors.average(:age)
  end
end
