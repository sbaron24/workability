class Review < ApplicationRecord
  validates :title, presence: true
  validates :overall_rating, presence: true
  validates :noise_rating, presence: true
  validates :wifi_rating, presence: true
  validates :capacity_rating, presence: true
  validates :outlet_rating, presence: true
  validates :group_max, presence: true

  belongs_to :user
  belongs_to :place
end
