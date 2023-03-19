# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module NotFound
          class Appender < ::Api::Tracks::Page::NotFound::Appender
            include ::SkillfindTech::Api::Tracks::Page::NotFound::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
