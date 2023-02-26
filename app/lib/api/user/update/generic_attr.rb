# frozen_string_literal: true

module Api
  module User
    module Update
      class GenericAttr < Grape::API
        before { authorize! }

        params do
          requires :name, type: String
          requires :value, type: String
        end
        put do
          name = params[:name].underscore
          value = params[:value]
          ::Commands::User::Update::GenericAttr.new(
            user_id: authenticated_user.id,
            name: name,
            value: value,
            constantized_site_name: constantized_site_name,
          ).call
        end
      end
    end
  end
end
