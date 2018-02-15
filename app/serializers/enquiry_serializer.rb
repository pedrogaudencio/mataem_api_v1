class EnquirySerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :mobile_number, :subject, :user
  has_one :user
end
