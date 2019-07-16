class Place < ApplicationRecord
  validates :name, presence: true
  validates :place_type, presence: true
  validates :location, presence: true
  validates :description, presence: true


  # add additional validations here
end
