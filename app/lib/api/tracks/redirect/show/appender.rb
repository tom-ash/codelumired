# frozen_string_literal: true

module Api
  module Tracks
    module Redirect
      module Show
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Redirect::Show::Meta

          def initialize(attrs)
            super
          end

          def call
            merge_meta
          end

          private

          def merge_meta
            meta.merge!(
              redirected_url: "#{domain_url}/#{redirect.redirected_url}",
              status: redirect.status,
            )
          end

          def redirect
            @redirect ||= attrs[:redirect]
          end
        end
      end
    end
  end
end
