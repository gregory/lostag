module Lostag
  module Resources
    class MessageOut < Grape::API
      desc 'send a mail to the owner of an object'
      params do
        requires :uuid, type: String, desc: 'the id of the qrcode'
        requires :email, type: String, desc: 'the email of the supahero'
        requires :message, type: String, desc: 'the message'
      end
      post ':uuid' do
        Commands::Founder::Send.perform(uuid: params[:uuid], message: params[:message], email: params[:email])
        {status: 'ok'}
      end
    end
  end
end
