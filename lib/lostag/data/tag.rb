module Lostag
  module Data
    class Tag
      include Mongoid::Document

      field :email
      field :uuid
      field :conversations, type: Hash #{uuid: email}
    end
  end
end
