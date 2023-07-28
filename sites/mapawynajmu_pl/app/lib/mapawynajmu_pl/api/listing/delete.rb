# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      class Delete < Grape::API
        before { authorize_for_announcement! }

        params { requires :id, type: Integer }

        delete do
          current_announcement.soft_delete!
        end
      end
    end
  end
end
