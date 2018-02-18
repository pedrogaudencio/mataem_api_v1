class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :mobile_number, :mobile_number_verified, :mobile_verification_code, :status, :loyalty_points, :gender, :date_of_birth
  belongs_to :restaurant
  has_one :user
  has_one :address
end
