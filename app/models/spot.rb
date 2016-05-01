class Spot < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :messages
end
