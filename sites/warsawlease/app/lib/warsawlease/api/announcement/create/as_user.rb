# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Create
        class AsUser < Grape::API
          helpers Warsawlease::Api::Announcement::Helpers::Attrs

          before { authorize! }

          params { use :announcement_attrs }
          post do
            announcement_attrs = { user_id: current_user.id, attrs: params[:announcement].merge(confirmed: true) }
            ::Warsawlease::Commands::Announcement::Create.new(announcement_attrs).call
            current_user.announcements.last
          end
        end
      end
    end
  end
end
