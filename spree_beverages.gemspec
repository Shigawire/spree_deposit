# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_beverages/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_beverages'
  s.version     = SpreeBeverages.version
  s.summary     = 'Spree plugin for beverage-specific products'
  s.description = 'Introduces a deposit fee and price-per-liter attribute'
  s.required_ruby_version = '>= 2.3.3'

  s.author    = 'Fabian Kübler'
  s.email     = 'fabian@mywasser.com'
  s.homepage  = 'https://github.com/mywasser/spree_beverages'
  s.license = 'BSD-3-Clause'

  # s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.2.0', '< 5.0'
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'
  # FIXME: This is an actual dependency
  # s.add_dependency 'spree_subscribable_products'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-screenshot'
  s.add_development_dependency 'chromedriver-helper'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot', '~> 4.7'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
