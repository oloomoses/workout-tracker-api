class Workout < ApplicationRecord
  has_many :track_its, dependent: :destroy
  # belongs_to :user
  validates_presence_of :name
end
