RACK_ENV = ENV['RACK_ENV'] || 'development' unless defined? RACK_ENV

require 'rubygems'
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

[
  'lib/lostag.rb',
  'ports/**/*.rb',
  'config/initializers/**/*.rb'
].each{ |path| Dir.glob(File.join(File.dirname(__FILE__), path), &method(:require))}

require "./config/environments/#{RACK_ENV}.rb" if File.exists?("./config/environments/#{RACK_ENV}.rb")
