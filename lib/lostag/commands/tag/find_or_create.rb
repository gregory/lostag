module Lostag
  module Commands
    module Tag
      class FindOrCreateByEmail
        include Interactor

        def perform
          tag = Lostag::Data::Tag.where(email: context[:email]).first

          context[:tag] = tag || Create.perform
        end
      end
    end
  end
end
