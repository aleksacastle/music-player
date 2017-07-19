source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

gem "rails", "~> 5.1.2"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "trailblazer", ">= 2.0.3"
gem "trailblazer-rails"
gem "trailblazer-cells"
gem "cells-rails"
gem "cells-slim"
gem "dry-validation"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "bootstrap-sass"
gem "jquery-rails"
gem "pg"
gem "simple_form"
gem "slim-rails"
gem "carrierwave", "~> 1.0"
gem "mini_magick"
gem "file_validators"
gem "html2slim", "~> 0.2.0"

######Authorizacion and Authentication######
gem "devise"
gem "pundit"

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "better_errors",  git: "https://github.com/charliesome/better_errors.git", branch: "master"
  gem "binding_of_caller"
  gem "guard-bundler"
  gem "guard-rails"
  gem "guard-rspec"
  gem "rails_layout"
  gem "rb-fchange", require: false
  gem "rb-fsevent", require: false
  gem "rb-inotify", require: false
  gem "spring-commands-rspec"
  gem "annotate"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-rescue"
  gem "awesome_print", require: "ap"
  gem "rails-erd", require: false

  # deploy stuff
  gem "capistrano", "~> 3.6"
  gem "capistrano-rails", "~> 1.3"
  gem "capistrano-passenger"
  gem "capistrano-rbenv", "~> 2.0"

end

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "poltergeist"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "factory_girl_rails"
  gem "faker"
  gem "rspec-rails"
  gem "shoulda-matchers", git: "https://github.com/thoughtbot/shoulda-matchers.git", branch: "rails-5"
  gem "pundit-matchers", "~> 1.3.0"
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem "launchy"
  gem "execjs"
  gem "therubyracer", platforms: :ruby
end
