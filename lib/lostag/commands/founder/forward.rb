module Lostag
  module Commands
    module Founder
      class Forward
        include Interactor

        def setup
          founder_uuid = context[:to][/founder\+([0-9a-z|-]+)@lostag\.gregory\.io/,1]
          founder_tag = Lostag::Data::Tag.where(uuid: founder_uuid).first

          owner_email = context[:from][/\<(.*)\>\z/, 1]
          owner_tag = Lostag::Data::Tag.where(email: owner_email).first

          @payload = {
            to: founder_tag.email,
            reply_to: "owner+#{owner_tag.uuid}@lostag.gregory.io",
            from: "victim@lostag.gregory.io",
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