module Lostag
  module Resources
    class MessageOut < Grape::API
      desc 'send a mail to the owner of an object'
      params do
        requires :uuid, type: String, desc: 'the id of the qrcode'
        requires :email, type: String, desc: 'the email of the supahero'
        requires :body, type: String, desc: 'the message'
      end
      post ':uuid' do
        Commands::Founder::Send.perform(uuid: params[:uuid], body: params[:body], email: params[:email])
        {status: 'ok'}
      end
    end
  end
end
