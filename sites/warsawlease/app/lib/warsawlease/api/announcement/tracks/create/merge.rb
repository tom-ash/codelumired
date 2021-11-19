# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Create
          class Merge < ::Warsawlease::Api::Announcement::Tracks::Base
            include ::Warsawlease::Api::Announcement::Tracks::Create::Meta

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
end
