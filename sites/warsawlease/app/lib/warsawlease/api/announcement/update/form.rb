# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Update
        class Form < Grape::API
          helpers Warsawlease::Api::Announcement::Helpers::Attrs

          before { authorize_for_announcement! }

          params do
            requires :id, type: Integer
            use :announcement_attrs
          end
          put do
            ::Warsawlease::Commands::Announcement::Update.new(id: current_announcement.id, attrs: params[:announcement]).call
          end
        end
      end
    end
  end
end
