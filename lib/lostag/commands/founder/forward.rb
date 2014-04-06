module Lostag
  module Commands
    module Founder
      class Forward
        include Interactor

        def setup
          founder_email = Mail::Address.new(context[:to]).address
          founder_uuid = founder_email[/founder\+([0-9a-z|-]+)@mails\.lostag\.com/,1]
          founder_tag = Lostag::Data::Tag.where(uuid: founder_uuid).first
          Errors::Log.perform(body: context) unless owner_tag.present?

          owner_email = Mail::Address.new(context[:from]).address
          owner_tag = Lostag::Data::Tag.where(email: owner_email).first
          Errors::Log.perform(body: context) unless owner_tag.present?

          @payload = {
            to: founder_tag.email,
            reply_to: "owner+#{owner_tag.uuid}@mails.lostag.com",
            from: "victim@mails.lostag.com",
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
