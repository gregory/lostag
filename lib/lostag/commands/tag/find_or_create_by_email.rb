module Lostag
  module Commands
    module Tag
      class FindOrCreateByEmail
        include Interactor

        def setup
          @email = ::Mail::Address.new(context[:email]).address
        end

        def perform
          tag = Lostag::Data::Tag.where(email: @email).first

          context[:tag] = tag.present? ? tag : Create.perform(email: @email).context[:tag]
        end
      end
    end
  end
end
