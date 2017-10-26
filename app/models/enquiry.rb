class Enquiry < ApplicationRecord
  belongs_to :user, optional: true

  after_create :fetch_user

  validates_presence_of :name, :email, :mobile_number, :subject

  private
    def fetch_user
      self.user = User.where(email: self.email).first
      self.save!
    end
end
