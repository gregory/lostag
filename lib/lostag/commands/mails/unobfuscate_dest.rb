module Lostag
  module Commands
    module Mails
      class UnobfuscateDest
        include Interactor

        def setup
          to_email = Mail::Address.new(context[:to]).address
          match = to_email.match(/(founder|owner|supahero|victim)\+([0-9a-z|-]+)@mails\.lostag\.com/)
          @email_to_alias, to_uuid = match[1], match[2]
          @to_tag   = Lostag::Data::Tag.find_by(uuid: to_uuid)
        end

        def perform
          context[:email_to_alias] = @email_to_alias
          context[:email_to]       = @to_tag.email
        end
      end
    end
  end
end
