class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :mobile_number, :mobile_number_verified, :mobile_verification_code, :status, :loyalty_points
  has_one :user
  has_one :address
end
