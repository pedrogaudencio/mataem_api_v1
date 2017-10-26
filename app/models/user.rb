class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          # :confirmable, 
          :omniauthable, :omniauth_providers => [:facebook]
  include DeviseTokenAuth::Concerns::User

  # Role - don't change!
  enum role: { customer: 0, delivery_boy: 1, business: 2, admin: 3 }

  has_one :profile, dependent: :destroy

  # full name or email
  delegate :full_name, to: :profile

  # callbacks
  # after_initialize do
  #   build_profile(language: 'da', user: self) if profile.nil?
  # end
end
