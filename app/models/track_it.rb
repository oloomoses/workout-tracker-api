class TrackIt < ApplicationRecord
  belongs_to :workout
  belongs_to :user
  validates_presence_of :calories, :minutes_recorded
end
