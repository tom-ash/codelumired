# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta
          end
        end
      end
    end
  end
end
