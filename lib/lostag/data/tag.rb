module Lostag
  module Data
    class Tag
      include Mongoid::Document

      field :email
      field :uuid
    end
  end
end
