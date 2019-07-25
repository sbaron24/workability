class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :reviews
  has_many :places

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    role == "admin"
  end

  def member?
    role == "member"
  end
end
