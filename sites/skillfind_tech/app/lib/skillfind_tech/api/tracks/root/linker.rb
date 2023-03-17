# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Linker < SkillfindTech::Api::Tracks::Common::Linker
          include ::SkillfindTech::Api::Tracks::Root::Meta

          private

          def href
            super.chomp('/')
          end
        end
      end
    end
  end
end
