require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }
  it { should have_one(:address) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:mobile_number) }
  it { should validate_numericality_of(:loyalty_points) }
  it { should_not allow_value(-1).for(:loyalty_points) }
  it { should allow_value(0).for(:loyalty_points) }
end
