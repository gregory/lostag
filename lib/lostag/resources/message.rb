module Lostag
  module Resources
    class Message < Grape::API
      desc 'show a form from a qrcode'
      params do
        requires :uuid, type: Integer, desc: 'the id of the qrcode'
        requires :message, type: String, desc: 'the message'
      end
      post ':uuid' do
        {uuid: params[:uuid]}
      end
    end
  end
end
