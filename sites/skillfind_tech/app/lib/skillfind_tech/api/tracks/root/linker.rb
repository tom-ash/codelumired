# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Linker < SkillfindTech::Api::Tracks::Common::Linker
          include ::SkillfindTech::Api::Tracks::Root::Meta

          ROOT_EN = '/'
          ROOT_PL = 'pl'

          private

          def href
            {
              en: ROOT_EN,
              pl: ROOT_PL,
            }[lang]
          end

          def path
            # TODO: Remove path from Common::Linker.
            @path ||= href
          end
        end
      end
    end
  end
end
