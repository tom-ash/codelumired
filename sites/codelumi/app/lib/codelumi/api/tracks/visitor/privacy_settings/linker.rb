# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Linker
            include ::Api::Tracks::Helpers::Linker
            include ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta
          end
        end
      end
    end
  end
end
