# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Linker
            include ::Warsawlease::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta
          end
        end
      end
    end
  end
end
