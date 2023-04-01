# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Redirects < Grape::API
        before { authorize! }

        post do
          ::SkillfindTech::Redirect.create!(
            added_by_id: authenticated_user.id,
            original_url: '_',
            redirected_url: '_',
            status: 301, # TODO: Get fromt the client.
          )
        end

        delete ':id' do
          redirect = ::SkillfindTech::Redirect.find(params[:id])
          redirect.destroy!
        end

        params do
          requires :original_url, type: String
          requires :redirected_url, type: String
        end
        put ':id' do
          redirect = ::SkillfindTech::Redirect.find(params[:id])
          redirect.update(
            original_url: params[:original_url],
            redirected_url: params[:redirected_url],
          )
        end
      end
    end
  end
end
