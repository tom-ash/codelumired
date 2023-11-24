# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Show
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Listing::Show::Meta
            include ::MapawynajmuPl::Api::Tracks::Listing::Show::Assets
            include ::MapawynajmuPl::Api::Tracks::Helpers::Listings
            include ::MapawynajmuPl::Api::Tracks::Helpers::Filters
            include ::MapawynajmuPl::Api::Tracks::Listing::Common::Filters

            private

            def texts
              listing_filter_texts
            end

            def control
              control_hash = {
                current_tile_id: announcement_id,
                map_options: {
                  center: {
                    lat: announcement.latitude,
                    lng: announcement.longitude,
                  },
                  zoom: 12.4,
                },
                isPinsDrawn: false,
              }.merge(filter_control)

              if ssr?
                control_hash.merge!(
                  shouldInitializeMap: false,
                )
              end

              control_hash
            end

            def data
              data_hash = {
                current_category: category_from_path,
                tile: serialized_announcement,
                announcements: serialized_announcements,
                amount: serialized_announcements.count,
              }.merge(filter_data)

              # if ssr? || attrs[:listings_obsolete]
              #   data_hash.merge!(
              #     announcements: serialized_announcements,
              #     amount: serialized_announcements.count,
              #   )
              # end

              data_hash
            end

            def inputs
              filter_inputs
            end

            def serialized_announcement
              @serialized_announcement ||= ::MapawynajmuPl::Serializers::Listing::Show.new(announcement).call.merge(title: title)
            end

            def announcement
              begin
                @announcement ||= ::MapawynajmuPl::Queries::Listing::ById.new(id: announcement_id).call
              rescue
                raise ::Api::ResourceNotFoundError
              end
            end

            def announcement_id
              @announcement_id ||= attrs[:url].match(/(\d+)-.*-(na-wynajem|for-(rent|lease)).*$/)[1]
            end

            def webPage
              {
                '@type': 'RealEstateListing',
                url: ::MapawynajmuPl::Api::Tracks::Listing::Show::Linker.new(announcement: announcement, lang: lang).call[:href],
                name: serialized_announcement[:title],
                # https://schema.org/Date
                # https://stackoverflow.com/questions/33262792/time-iso-8601-in-ruby
                datePosted: announcement.created_at.iso8601,
              }.merge(descriptionObject)
            end

            def descriptionObject
              return {} if serialized_announcement[:description].nil?

              {
                description: serialized_announcement[:description],
              }
            end
          end
        end
      end
    end
  end
end
