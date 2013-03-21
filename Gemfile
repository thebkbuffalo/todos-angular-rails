source 'https://rubygems.org'
gem 'rails', '3.2.13'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "haml-rails", ">= 0.4"
  gem "therubyracer", ">= 0.11.3", :platform => :ruby, :require => "v8"
  #gem 'jquery-rails'
  gem 'angular-rails' # For angular assets
  gem 'angularjs_scaffold' # For angular scaffolds
end

group :development do
  gem "quiet_assets", ">= 1.0.2"
  gem "better_errors", ">= 0.7.2"
  gem "binding_of_caller", ">= 0.7.1", :platforms => [:mri_19, :rbx]
  gem "html2haml", ">= 1.0.1"
end

group :database do
  gem 'mysql2'
end

gem "rspec-rails", ">= 2.12.2", :group => [:development, :test]
gem "factory_girl_rails", ">= 4.2.0", :group => [:development, :test]
gem "simple_form", ">= 2.1.0"
