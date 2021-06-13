class TrackIt < ApplicationRecord
  belongs_to :workout, counter_cache: true
  belongs_to :user
  validates_presence_of :calories, :minutes_recorded
end
