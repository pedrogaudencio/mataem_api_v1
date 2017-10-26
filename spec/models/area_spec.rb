require 'rails_helper'

RSpec.describe Area, type: :model do
  it { should belong_to(:city) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:city) }
end
