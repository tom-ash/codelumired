# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta
          end
        end
      end
    end
  end
end
