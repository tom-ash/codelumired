# frozen_string_literal: true

module Api
  module User
    module Update
      class Attribute < Grape::API
        before { authorize! }

        params do
          requires :name, type: String
          requires :value, type: String
        end
        patch do

          # TODO: Add attribute restrictions - no email, password, etc. Use whitelist.

          name = params[:name].underscore
          value = params[:value]
          ::Commands::User::Update::Attribute.new(
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
