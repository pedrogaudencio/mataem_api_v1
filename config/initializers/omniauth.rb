Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :facebook,      ENV['facebook_key'], ENV['facebook_secret']
  # provider :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret
end
