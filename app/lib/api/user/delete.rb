# frozen_string_literal: true

module Api
  module User
    class Delete < Grape::API
      namespace 'verification' do
        before { authorize! }
        put do
          ::Mailers::Verification.new(
            email: authenticated_user.email,
            namespace: 'user/delete',
            lang: lang,
            constantized_site_name: constantized_site_name,
          ).send
        end
      end

      namespace do
        before { authorize! }
        params { requires :verification_code, type: String }
        delete do
          ::Commands::User::Verify.new(user: authenticated_user, namespace: 'user/delete', verification_code: verification_code).call
          ::Commands::User::Delete.new(user_id: authenticated_user.id, constantized_site_name: constantized_site_name).call
          site::Api::Tracks::Root::Linker.new(lang.to_sym).call
        end
      end
    end
  end
end
