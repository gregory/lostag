require 'rack'
require 'rack/cors'
require 'logger'
require 'fileutils'

require './init'

class ::Logger; alias_method :write, :<<; end # for Rack::CommonLogger

path = File.join(File.dirname(__FILE__), "log")
FileUtils.mkdir_p path
$logger = ::Logger.new(File.join(path, "#{RACK_ENV}.log"))

Dir["middleware/**/*.rb"].each{|file| require "./#{file}" }

use Rack::CommonLogger, $logger
use Lostag::Middleware::Logger, $logger

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:options, :post, :get], max_age: 50, credentials: false
  end
end

#use PryRescue::Rack if RACK_ENV == 'development'

run Lostag::Resources::Router
