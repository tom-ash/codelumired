# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module Show
          class Appender < ::Api::Tracks::Page::Show::Appender
            include ::SkillfindTech::Api::Tracks::Page::Show::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
