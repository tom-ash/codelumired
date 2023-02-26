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
          ::Commands::User::Update::GenericAttr.new(user_id: authenticated_user.id, name: 'country_code', value: params[:country_code], constantized_site_name: constantized_site_name).call
          ::Commands::User::Update::GenericAttr.new(user_id: authenticated_user.id, name: 'phone_number', value: params[:phone_number], constantized_site_name: constantized_site_name).call
        end
      end
    end
  end
end
