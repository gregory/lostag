module Lostag
  module Commands
    module Mails
      class NotifyOwner
        include Interactor

        def setup
          @payload = {
            to: context[:tag].email,
            from: "supahero@mails.lostag.com",
            reply_to: "founder+#{context[:owner_tag].uuid}@mails.lostag.com",
            subject: "Youpie, someone has just recovered something from you!",
            body: context[:body]
          }
        end

        def perform
          context[:mail_response] = Pony.mail(@payload)
        rescue Net::SMTPAuthenticationError => e
          fail!(message: "can't send your mails")
        end
      end
    end
  end
end
