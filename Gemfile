source 'https://rubygems.org'

ruby '1.9.3'
gem 'charlatan', git: 'https://github.com/gregory/charlatan.git', branch: :master
#dependencies only for when we run rackup
gem 'puma', '~> 2.8.1'
gem 'mongoid', '~> 3.1.6'
gem 'bson_ext'
gem 'rack-cors', "~> 0.2.9"
gem 'settingslogic'
gem 'mail'
gem 'pry'

group :test do
  gem 'database_cleaner'
end
group :test, :development do
  gem 'rspec'
  gem "pry"
  gem "pry-debugger"
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem 'rerun'
end

# Specify your gem's dependencies in jm_player.gemspec
gemspec
