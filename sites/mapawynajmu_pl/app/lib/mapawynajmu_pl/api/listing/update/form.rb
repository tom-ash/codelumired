# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Update
        class Form < Grape::API
          helpers MapawynajmuPl::Api::Listing::Helpers::Attrs

          before { authorize_for_announcement! }

          params do
            requires :id, type: Integer
            use :announcement_attrs
          end
          put do
            ::MapawynajmuPl::Commands::Listing::Update.new(
              id: current_announcement.id,
              attrs: params[:announcement]
            ).call
            current_announcement.url(lang.to_sym)
          end
        end
      end
    end
  end
end
