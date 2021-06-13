require 'rails_helper'

RSpec.describe TrackIt, type: :model do
  it { should belong_to(:workout) }
  it { should validate_presence_of(:calories) }
  it { should validate_presence_of(:minutes_recorded) }
end
