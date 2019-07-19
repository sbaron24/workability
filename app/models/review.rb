class Review < ApplicationRecord
  validates :title, presence: true
  validates :overall_rating, presence: true
  validates :noise_rating, null: false
  validates :wifi_rating, null: false
  validates :capacity_rating, null: false
  validates :outlet_rating, null: false
  validates :group_max, null: false
  validates :vote_count, null: false

  belongs_to :user, optional: true
  belongs_to :place, optional: true
end
