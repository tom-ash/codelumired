# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Assets
        module Index
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Assets::Index::Meta

            private

            def data
              {
                assets: ::MapawynajmuPl::Asset.all.sort_by(&:name),
              }
            end

            def texts
              {
                pl: {
                  addAssetButtonLabel: 'Dodaj Asset',
                },
                en: {
                  addAssetButtonLabel: 'Add Asset',
                },
              }[lang]
            end

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
