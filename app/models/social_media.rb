class SocialMedia < ApplicationRecord
  belongs_to :restaurant

  # TODO: add individual validation for each social media url
  validates :facebook_url, format: { with: URI.regexp }, if: 'facebook_url.present?'
  validates :twitter_url, format: { with: URI.regexp }, if: 'twitter_url.present?'
  validates :google_plus_url, format: { with: URI.regexp }, if: 'google_plus_url.present?'
  validates :linkedin_url, format: { with: URI.regexp }, if: 'linkedin_url.present?'
end
