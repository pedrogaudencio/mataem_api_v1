source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers'

# for environment variables setting
gem 'figaro'

# auth
# gem 'devise'
gem 'devise_token_auth'
gem 'omniauth-facebook'

# permissions
gem "cancan"

# cors
gem 'rack-cors', :require => 'rack/cors'

# for file attachments
gem "paperclip"
gem "aws-sdk"

# for sms module
gem "httparty"

# for work schedule
gem 'tod'

# for translations
gem 'globalize'

# for notifications
gem 'one_signal'

# hide records instead of deleting
# gem 'acts_as_paranoid', '~> 0.5.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use RSpec for specs
  gem 'rspec-rails', '>= 3.5.0'
  # Use Factory Girl for generating random test data
  gem 'factory_girl_rails'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'apipie-rails'
  gem 'rails-erd', require: false
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end

group :production do
  gem 'pg'
end
ruby '2.4.0'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'mandrill-api'
