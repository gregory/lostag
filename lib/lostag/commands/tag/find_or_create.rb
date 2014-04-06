module Lostag
  module Commands
    module Tag
      class FindOrCreateByEmail
        include Interactor

        def perform
          tag = Lostag::Data::Tag.where(email: context[:email]).first

          context[:tag] = tag.present? ? tag : Create.perform(email: context[:email]).context[:tag]
        end
      end
    end
  end
end
