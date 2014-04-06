require 'securerandom'
module Lostag
  module Commands
    module Tag
      class Create
        include Interactor

        def setup
          context[:uuid] = SecureRandom.uuid
        end

        def perform
          context[:tag] = Lostag::Data::Tag.create(uuid: context[:uuid], email: context[:email])
        end
      end
    end
  end
end
