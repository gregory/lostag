require_relative 'unobfuscate_dest'
require_relative 'obfuscate_sender'
require_relative 'send'

module Lostag
  module Commands
    module Mails
      class Forwarding
        include Interactor::Organizer

        organize [
          UnobfuscateDest,
          ObfuscateSender,
          Send
        ]
      end
    end
  end
end
