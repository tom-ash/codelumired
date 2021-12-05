# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta
          end
        end
      end
    end
  end
end
