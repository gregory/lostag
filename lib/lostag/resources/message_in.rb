module Lostag
  module Resources
    class MessageIn < Grape::API
      desc 'forward the message in to the right person'
      post do
        if params[:to].match(/founder/)
          Commands::Founder::Forward.perform(params)
        else
          Commands::Owner::Forward.perform(params)
        end
        {status: 'ok'}
      end
    end
  end
end
