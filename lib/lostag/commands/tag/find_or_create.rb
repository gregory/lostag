module Lostag
  module Commands
    module Tag
      class FindOrCreateByEmail
        include Interactor

        def perform
          tag = Lostag::Data::Tag.find_by(email: context[:email])

          context[:tag] = tag || Create.perform
        end
      end
    end
  end
end
