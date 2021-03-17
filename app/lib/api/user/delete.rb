# frozen_string_literal: true

module Api
  module User
    class Delete < Grape::API
      namespace 'verification' do
        before { authorize! }
        put do
          ::Mailers::Verification.new(email: current_user.email, namespace: 'user/delete', lang: lang, site_name: site_name).send
        end
      end

      namespace do
        before { authorize! }
        params { requires :verification_code, type: String }
        delete do
          ::Commands::User::Verify.new(user: current_user, namespace: 'user/delete', verification_code: verification_code).call
          ::Commands::User::Delete.new(user_id: current_user.id, site_name: site_name).call
        end
      end
    end
  end
end
