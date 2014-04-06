module Lostag
  module Commands
    module Founder
      class Send
        include Interactor

        def setup
          context[:tag] = Lostag::Data::Tag.find_by(uuid: context[:uuid])
          @payload = {
            to: context[:tag].email,
            from: "supahero@lostag.gregory.io",
            reply_to: "founder+#{context[:uuid]}@lostag.gregory.io",
            subject: "Youpie, someone has just recovered something from you!",
            body: context[:message]
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
