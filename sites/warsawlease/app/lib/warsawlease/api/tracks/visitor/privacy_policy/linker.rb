# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Linker
            include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta
          end
        end
      end
    end
  end
end
