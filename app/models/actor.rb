class Actor < ApplicationRecord
  validates_presence_of :name, :age

  has_many :actormovies
  has_many :movies, through: :actormovies

  def costars
    movies.joins(:actors).where("actors.id != #{self.id}").distinct.pluck("actors.name")
  end
end
