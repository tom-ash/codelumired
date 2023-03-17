# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module Index
          class Linker < ::Api::Tracks::Page::Index::Linker
            include ::SkillfindTech::Api::Tracks::Page::Index::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
