class Place < ApplicationRecord
  validates :name, presence: true
  validates :place_type, presence: true
  validates :description, presence: true
  validates :wifi, inclusion: { in: [true, false] }
  validates :food, inclusion: { in: [true, false] }
  validates :standing_options, inclusion: { in: [true, false] }
  validates :outdoor_seating, inclusion: { in: [true, false] }
  validates :group_capacity, presence: true
  validates :overall_workability, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :neighborhood, presence: true
  validates :user_id, presence: true

  after_initialize :init

  belongs_to :user

  mount_uploader :place_photo, PlacePhotoUploader

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
