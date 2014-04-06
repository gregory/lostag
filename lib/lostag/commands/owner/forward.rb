module Lostag
  module Commands
    module Owner
      class Forward
        include Interactor

        def setup
          owner_uuid = context[:to][/owner\+([0-9a-z|-]+)@lostag\.gregory\.io/,1]
          owner_tag = Lostag::Data::Tag.where(uuid: owner_uuid).first

          founder_email = context[:from][/\<(.*)\>\z/, 1]
          founder_tag = Lostag::Data::Tag.where(email: founder_email).first

          @payload = {
            to: owner_tag.email,
            reply_to: "founder+#{founder_tag.uuid}@lostag.gregory.io",
            from: "supahero@lostag.gregory.io",
            subject: context['subject'],
            body: context['text'],
          }
        end

        def perform
          context[:mail_response] = Pony.mail(@payload)
        rescue Net::SMTPAuthenticationError
          fail!(message: "can't send your mails")
        end
      end
    end
  end
end
