# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Meta
          end
        end
      end
    end
  end
end
