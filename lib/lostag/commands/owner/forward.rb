require 'mail'
module Lostag
  module Commands
    module Owner
      class Forward
        include Interactor

        def setup
          owner_email = Mail::Address.new(context[:to]).address
          owner_uuid = owner_email[/owner\+([0-9a-z|-]+)@lostag\.gregory\.io/,1]
          owner_tag = Lostag::Data::Tag.where(uuid: owner_uuid).first

          founder_email = Mail::Address.new(context[:from]).address
          founder_tag = Lostag::Data::Tag.where(email: founder_email).first

          @payload = {
            to: owner_tag.email,
            reply_to: "founder+#{founder_tag.uuid}@mails.lostag.com",
            from: "supahero@mails.lostag.com",
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
