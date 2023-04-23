# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Index
          module User
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::Listing::Index::User::Meta

              private

              def label
                {
                  pl: 'Moje ogłoszenia',
                  en: 'My listings',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
