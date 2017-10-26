require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:area).dependent(:destroy) }
  it { should belong_to(:profile) }
  it { should validate_presence_of(:area) }
  it { should validate_presence_of(:address_type) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:number) }
end
