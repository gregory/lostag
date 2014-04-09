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
        owner_tag = Lostag::Data::Tag.find_by(uuid: params[:uuid])
        Commands::Founder::InitiateConversation.perform(owner_tag: owner_tag, email: params[:email], body: params[:body])
        {status: 'ok'}
      end
    end
  end
end
