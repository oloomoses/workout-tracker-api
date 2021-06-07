class Workout < ApplicationRecord
  has_many :track_its, dependent: :destroy
  validates_presence_of :name
end
