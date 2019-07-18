class Place < ApplicationRecord
  validates :name, presence: true
  validates :place_type, presence: true
  validates :description, presence: true
  validates :wifi, presence: true
  validates :food, presence: true
  validates :standing_options, presence: true
  validates :outdoor_seating, presence: true
  validates :group_capacity, presence: true
  validates :overall_workability, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :neighborhood, presence: true

  after_initialize :init

  def init
    self.group_capacity = 1
    self.overall_workability = 0
  end

  def self.place_type
    ['Coffee shop', 'Park', 'Library', 'Museum']
  end

  def self.neighborhoods
    ['Boston', 'Medford', 'Concord', 'Somerville', 'Brighton']
  end
end
