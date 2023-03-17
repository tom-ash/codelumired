# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module Edit
          class Linker < ::Api::Tracks::Page::Edit::Linker
            include ::SkillfindTech::Api::Tracks::Page::Edit::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
