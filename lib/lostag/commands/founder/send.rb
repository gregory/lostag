module Lostag
  module Commands
    module Founder
      class Send
        include Interactor

        def setup
          @owner_tag = Lostag::Data::Tag.find_by(uuid: context[:uuid])
          @founder_tag = Commands::Tag::FindOrCreateByEmail.perform(email: context[:email]).context[:tag]
          @payload = {
            to: @owner_tag.email,
            from: "supahero@lostag.gregory.io",
            reply_to: "founder+#{@founder_tag.uuid}@lostag.gregory.io",
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
