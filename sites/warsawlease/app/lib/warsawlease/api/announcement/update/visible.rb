# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Update
        class Visible < Grape::API
          before { authorize_for_announcement! }

          params { requires :id, type: Integer }

          put do
            current_announcement.update_attribute(:visible, !current_announcement.visible)
            ::Warsawlease::Serializers::Announcement::Edit.new(current_announcement).call
          end
        end
      end
    end
  end
end
