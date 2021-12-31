# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Meta
          end
        end
      end
    end
  end
end
