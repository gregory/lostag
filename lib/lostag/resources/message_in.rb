require 'mail'
module Lostag
  module Resources
    class MessageIn < Grape::API
      desc 'forward the message in to the right person'
      post do
        result = Commands::Mails::Forwarding.perform(params)
        {status: 'ok'}
      end
    end
  end
end
