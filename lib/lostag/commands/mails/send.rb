module Lostag
  module Commands
    module Mails
      class Send
        include Interactor

        def setup
          @payload = {
            to:       context[:email_to],
            from:     context[:email_from],
            reply_to: context[:email_reply_to],
            subject:  context[:subject],
            body:     context[:body]
          }
        end

        def perform
          context[:mail_response] = Pony.mail(@payload)
        end
      end
    end
  end
end
