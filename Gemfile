source 'https://rubygems.org'

# For full text search on pg db
gem 'pg_search'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Continuation of the simple authorization solution for Rails which is decoupled from user roles
gem 'cancancan'
# Quiet Assets turns off Rails asset pipeline log.
gem 'quiet_assets'


gem 'bootstrap-sass'
# Image assets and character information for emoji.
gem 'gemoji'
# Assists with bootstrap for font icons (vectors)
gem 'font-awesome-rails'
gem 'simple_form'
# Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator
gem 'kaminari'
gem 'bootstrap-kaminari-views'
gem 'wow-rails'

# Data spoofer
gem 'faker'
gem 'delayed_job_active_record'
gem 'delayed_job_web'
# BestInPlace is a jQuery script and a Rails helper that provide the method best_in_place to display any object field easily editable for the user by just clicking on it. It supports input data, text data, boolean data and custom dropdown data. It works with RESTful controllers.
gem 'best_in_place', '~> 3.0.1'

# A library for validating URLs in Rails
gem 'validate_url'

# Middleware that assists in making Rack-based apps compatible with CORS
gem 'rack-cors', :require => 'rack/cors'
# Assists in helping upload files to your Ruby application
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
# Ruby Cloud services library
gem 'fog'
# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick'

# Use Unicorn as the app server
# gem 'unicorn'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'rails-erd'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "letter_opener"
  gem 'byebug'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry'
  gem 'rspec-rails', '~> 3.4.2'
  gem 'factory_girl_rails'
  gem 'guard-rspec', require: false
  gem 'hirb'
  gem 'awesome_print'
  gem 'interactive_editor'
end


group :production do
  gem 'rails_12factor'
end
