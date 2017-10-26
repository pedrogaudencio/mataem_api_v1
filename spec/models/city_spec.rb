require 'rails_helper'

RSpec.describe City, type: :model do
  it { should have_many(:areas).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:status) }
end
