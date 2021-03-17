# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      class Update < Grape::API
        helpers Warsawlease::Api::Announcement::Helpers::Attrs

        before { authorize! }

        params do
          requires :id, type: Integer
          use :announcement_attrs
        end
        put do
          ::Warsawlease::Commands::Announcement::Update.new(id: params[:id], attrs: params[:announcement]).call
        end
      end
    end
  end
end
