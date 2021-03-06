source 'https://rubygems.org'

# After pushing to heroku, I was advised to add this line. Heroku told me 2.2.4.
# When issuing bundler install I got an error stating I needed to use 2.3.1
# ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'haml'

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'embedly'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# added per cp #24
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# added per mentor instruction
group :test do
  # gem 'byebug', platform: :mri # in original files

  # gems added per instructor
  gem 'shoulda'
  gem 'simplecov', :require => false, :group => :test
  gem 'pundit-matchers', '~> 1.1.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # added per cp #24
  gem 'sqlite3'
  # added per mentor instruction
  gem 'better_errors'
  gem 'binding_of_caller'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# per cp 27
gem 'bootstrap-sass'
gem 'bootswatch-rails'

# per devise docs
gem 'devise'

# per cp 44 that referenced https://www.bloc.io/resources/environment-variables-with-figaro
gem 'figaro', '1.0'

# per cp 7 in blockmarks project
gem 'pundit'
