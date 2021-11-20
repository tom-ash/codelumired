# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module PrivacySettings
          class Merge < ::Codelumi::Api::Visitor::Tracks::Base
            include ::Codelumi::Api::Visitor::Tracks::PrivacySettings::Meta

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
