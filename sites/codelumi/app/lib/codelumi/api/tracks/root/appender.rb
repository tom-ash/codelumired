# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Root
        class Appender
          include ::Codelumi::Api::Tracks::Helpers::Appender
          include ::Codelumi::Api::Tracks::Root::Meta

          def call
            merge_meta
          end

          private

          def merge_meta
            meta.merge!(
              title: title,
              keywords: keywords,
              description: description
            )
          end
        end
      end
    end
  end
end
