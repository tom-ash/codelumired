# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Codelumi::Api::Tracks::Root::Meta

          private

          def page_name
            @page_name ||= 'root'
          end
        end
      end
    end
  end
end
