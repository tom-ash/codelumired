# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Summary
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::Listing::Create::Summary::Meta
              include ::MapawynajmuPl::Api::Tracks::Listing::Common::Promotion

              private

              def texts
                @promotion_texts ||= getTexts('sites/mapawynajmu_pl/app/lib/mapawynajmu_pl/api/tracks/listing/create/summary/texts.json')[lang].merge(promotion_texts)
              end

              def data
                {
                  announcement: ::MapawynajmuPl::Serializers::Listing::Show.new(announcement).call.merge(
                    path: announcement.url(lang),
                    title: announcement.title(lang),
                  ),
                }
              end
            end
          end
        end
      end
    end
  end
end
