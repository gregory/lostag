module Lostag
  module Data
    class Tag
      include ::Mongoid::Document
      ##include Mongoid::Player::Writer
      ##include Mongoid::Player::Queries

      #store_in collection: 'payments'

      #field :name
      #field :nick
      #field :uuid

      #validates_presence_of :uuid, :name, :nick
      #validates_uniqueness_of :uuid, :nick
    end
  end
end
