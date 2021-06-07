class User < ApplicationRecord
  has_secure_password
  # has_many :workouts, foreign_key: :created_by
  has_many :track_its, dependent: :destroy

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
end
