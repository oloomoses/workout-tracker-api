require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:track_its) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should allow_value('user@example.com').for(:email) }
  it { should validate_presence_of(:password_digest) }
end
