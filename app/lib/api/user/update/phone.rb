# frozen_string_literal: true

module Api
  module User
    module Update
      class Phone < Grape::API
        before { authorize! }

        desc 'Updates the User\'s phone.'
        params do
          requires :country_code, type: String, desc: 'User\'s Area Code.'
          requires :phone_number, type: String, desc: 'User\'s Phone Number.'
        end
        put do
          phone = { code: params[:country_code], body: params[:phone_number], verified: true}
          ::Commands::User::Update::GenericAttr.new(user_id: current_user.id, name: 'phone', value: phone, site_name: site_name).call
        end
      end
    end
  end
end
