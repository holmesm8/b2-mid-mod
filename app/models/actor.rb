class Actor < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :studio

  has_many :actormovies
  has_many :movies, through: :actormovies
end
