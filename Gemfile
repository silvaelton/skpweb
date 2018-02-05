source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

gem 'turbolinks', '~> 5'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'

gem 'bcrypt', '~> 3.1.7'

gem 'puma', '~> 3.7'

gem 'simple_form'
gem 'slim'

gem 'sass-rails'
gem 'semantic-ui-sass'

gem 'email_validator'
gem 'validates_cpf_cnpj'

gem 'pg'

gem 'chartkick'

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'rails_12factor'
end
