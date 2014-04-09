require_relative '../tag/find_or_create_by_email'
require_relative '../mails/notify_owner'

module Lostag
  module Commands
    module Founder
      class InitiateConversation
        include Interactor::Organizer

        organize [
          Tag::FindOrCreateByEmail,
          Mails::NotifyOwner
        ]
      end
    end
  end
end
