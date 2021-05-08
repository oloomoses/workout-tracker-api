class TrackIt < ApplicationRecord
  belongs_to :workout
  validates_presence_of :date, :description, :minutes_recorded
end
