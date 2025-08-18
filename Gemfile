source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 8.0.2"
gem "propshaft"
# moved sqlite3 out of global and into :development, :test group
# gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false
# gem "image_processing", "~> 1.2"

group :development, :test do
  # DB adapter for local dev & tests
  gem "sqlite3", ">= 2.1"

  # Debugging
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Security and style
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  # Testing framework
  gem "rspec-rails", "~> 8.0"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

group :production do
  # DB adapter for production (Heroku/servers)
  gem "pg", "~> 1.5"
end
