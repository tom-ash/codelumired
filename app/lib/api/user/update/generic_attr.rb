# frozen_string_literal: true

module Api
  module User
    module Update
      class GenericAttr < Grape::API
        before { authorize! }

        params do
          requires :value, type: String
          requires :name, type: String
        end
        put do
          name = params[:name]
          value = params[:value]
          ::Commands::User::Update::GenericAttr.new(user_id: current_user.id, name: name, value: value, site_name: site_name).call
        end
      end
    end
  end
end
