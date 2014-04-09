module Lostag
  module Commands
    module Mails
      class ObfuscateSender
        include Interactor

        def setup
          #TODO: add a counter so that he can only send 3 consecutive mails
          #TODO: strip the + for the sender not to send from many emails. ex: greg+123, greg+12
          from_email = Mail::Address.new(context[:from]).address
          @from_tag = Lostag::Data::Tag.find_by(email: from_email)
        end

        def perform
          context[:email_from_alias] = "#{(context[:email_to_alias] == ('founder' || 'supahero') ?  'victim' : 'supahero' )}"
          context[:email_from]       = "#{context[:email_from_alias]}@mails.lostag.com"
          context[:email_reply_to]   = "#{context[:email_to_alias]}+#{@from_tag.uuid}@mails.lostag.com"
        end
      end
    end
  end
end
