class EnquirySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :mobile_number, :subject
  has_one :user
end
