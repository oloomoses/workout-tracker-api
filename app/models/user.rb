class User < ApplicationRecord
  has_secure_password
  has_many :track_its, dependent: :destroy

  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
end
