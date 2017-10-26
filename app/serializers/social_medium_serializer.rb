class SocialMediumSerializer < ActiveModel::Serializer
  attributes :id, :facebook_url, :twitter_url, :google_plus_url, :linkedin_url, :facebook_app_id, :facebook_secret_key
  has_one :restaurant
end
