source 'https://rubygems.org'

# Recent Ruby
ruby '2.1.0'

# Rails
gem 'rails', '4.0.2'

# Database
gem 'sqlite3', group: [:development, :test]
gem 'pg', group: [:production]

# Asset helpers
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

# JSON objects over giant hashes
gem 'jbuilder', '~> 1.2'

# Make things faster!
gem 'turbolinks'

# Make things nicer
gem 'bootstrap-sass', '>= 3.0.0.0'

# Authentication
gem 'devise'

# Dot env files
gem 'figaro'

# Use Puma as web handler
gem 'puma'

# Authorization
gem 'rolify'
gem 'cancan'

# Easy form builders
gem 'simple_form'

# Photo tags
gem 'acts-as-taggable-on'

# Follow users
gem "acts_as_follower"

# User preferences
gem 'ledermann-rails-settings', :require => 'rails-settings'

# Comments
gem 'acts_as_commentable'

# Allow users to "like" photos
gem 'acts_as_votable'

# Upload photos + avatars
gem "paperclip", "~> 3.0"

# News feed
gem 'public_activity'

# Count page views
gem 'impressionist'

# Allow markdown on the comments
gem 'bluecloth'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'pry'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
