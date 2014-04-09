require 'securerandom'
module Lostag
  module Commands
    module Tag
      class Create
        include Interactor

        def setup
          context[:uuid] = SecureRandom.uuid
        end

        def perform
          #TODO: handle email validation
          context[:tag] = Lostag::Data::Tag.create(uuid: context[:uuid], email: context[:email])

          binding.pry
          payload = {
            to: context[:tag].email,
            from: "no-reply@mails.lostag.com",
            subject: "We've just generate a qrcode for you to stick it on your stuffs",
            body: "You can find it on this link: http://www.lostag.com/#/tag/#{context[:tag].uuid}",
          }
          context[:mail_response] = Pony.mail(payload)
        end
      end
    end
  end
end
