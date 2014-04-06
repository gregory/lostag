require 'rubygems'
require 'bundler/setup'
require 'wisper'
require 'interactor'
require 'grape'
require 'json'
require 'roar/representer/json'
require 'roar/representer/json/hal' #TODO: remvoe if unused
require 'roar/representer/json/collection_json'

Dir.chdir(File.expand_path(File.join(File.dirname(__FILE__)))) do
  [
    'repository.rb',
    '{commands,roles,data}/**/*.rb',
    '{representers,resources}/**/*.rb',
  ].each{ |path| Dir.glob(File.join(File.dirname(__FILE__), "lostag/#{path}"), &method(:require))}
end

module Lostag
  module Resources
    class Router < Grape::API
      CONTENT_TYPE = "application/json"
      RACK_CONTENT_TYPE_HEADER = {"content-type" => CONTENT_TYPE}

      format :json
      default_format :json
      cascade :false
      content_type :json, CONTENT_TYPE

      before do
        route_version = params['route_info'].route_version
        available_versions = Router::versions

        if route_version.nil?
          params['version'] =  available_versions.last
        else
          desired_version    = Integer(route_version)
          params['version'] = available_versions.select { |i| i <= desired_version }.last || available_versions.first
        end
      end
      rescue_from Grape::Exceptions::Validation do |e|
        Rack::Response.new({ message: e.message }.to_json, 412, RACK_CONTENT_TYPE_HEADER).finish
      end

      rescue_from Mongoid::Errors::DocumentNotFound do |e|
        Rack::Response.new({ message: "Sounds like we were not able to find the document, please try again" }.to_json, 404, RACK_CONTENT_TYPE_HEADER).finish
      end

      rescue_from Exception do |e|
        Rack::Response.new({ message: "Something really bad happened, please contact someone!!" }.to_json, 500, RACK_CONTENT_TYPE_HEADER).finish
      end

      version Lostag::Resources::VERSION, using: :param, parameter: 'version'

      mount Tag => '/tags'
      mount MessageIn => '/messages/in'
      mount MessageOut => '/messages/out'

      #add_swagger_documentation mount_path: '/doc'
    end
  end
end
