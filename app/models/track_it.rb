class TrackIt < ApplicationRecord
  belongs_to :workout
  belongs_to :user
  validates_presence_of :date, :description, :minutes_recorded
end
