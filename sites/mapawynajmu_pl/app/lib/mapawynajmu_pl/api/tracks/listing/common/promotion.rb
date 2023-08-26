# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Common
          module Promotion
            private

            def promotion_texts
              @promotion_texts ||= getTexts('sites/mapawynajmu_pl/app/lib/mapawynajmu_pl/api/tracks/listing/common/promotion_texts.json')[lang]
            end
          end
        end
      end
    end
  end
end
