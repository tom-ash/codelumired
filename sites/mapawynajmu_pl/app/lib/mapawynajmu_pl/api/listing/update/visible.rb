# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Update
        class Visible < Grape::API
          before { authorize_for_announcement! }

          params { requires :id, type: Integer }

          put do
            current_announcement.update_attribute(:visible, !current_announcement.visible)
            camelize(::MapawynajmuPl::Serializers::Listing::Edit.new(current_announcement).call)
          end
        end
      end
    end
  end
end
