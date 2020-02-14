class Movie < ApplicationRecord
  validates_presence_of :name, :creation_year, :genre

  belongs_to :studio
  has_many :actormovies
  has_many :actors, through: :actormovies
end
