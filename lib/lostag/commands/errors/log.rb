module Lostag
  module Commands
    module Errors
      class Log
        include Interactor
        def setup
          @payload = {
            to: "greg2502@gmail.com",
            from: "errors@mails.lostag.com",
            subject: "There were an error",
            body: context[:body],
          }
        end

        def perform
          Pony.mail(@payload)
        end
      end
    end
  end
end
