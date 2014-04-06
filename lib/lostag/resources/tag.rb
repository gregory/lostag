module Lostag
  module Resources
    class Tag < Grape::API
      desc 'generate a new qrcode'
      params do
        requires :email, type: String, desc: 'the email to generate the qrcode'
      end
      post do
        result = Commands::Tag::FindOrCreateByEmail.perform(email: params[:email])
        { uuid: result.context[:tag].uuid }
      end
    end
  end
end
