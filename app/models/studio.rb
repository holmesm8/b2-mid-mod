class Studio < ApplicationRecord
  validates_presence_of :name

  has_many :movies
end
