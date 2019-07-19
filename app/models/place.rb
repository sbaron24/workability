class Place < ApplicationRecord
  validates :name, presence: true
  validates :place_type, presence: true
  validates :location, presence: true
  validates :description, presence: true
  has_many :reviews
  belongs_to :user, optional: true


  def self.place_type
    ['Coffee shop', 'Park', 'Library', 'Museum']
  end

  def self.locations
    ['Boston', 'Medford', 'Concord', 'Somerville', 'Brighton']
  end
end
