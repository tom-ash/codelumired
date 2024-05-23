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
          if params[:name] == 'logo'
            temporary_logo ||= Aws::S3::Object.new(
              credentials: CREDS,
              region: Rails.application.secrets.aws_region,
              bucket_name: bucket,
              key: "temporary/#{params[:value]}",
            )

            authenticated_user.logo = "#{authenticated_user.business_name.parameterize}-#{SecureRandom.uuid}.png"
            authenticated_user.save!
            temporary_logo.move_to("#{bucket}/logos/#{authenticated_user.logo}")
            return
          end

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
