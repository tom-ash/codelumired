# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            TRACK = 'announcement/show'

            UNLOCALIZED_PATH = {
              pl: %r{^\/?\d+-.*-na-wynajem.*$},
              en: %r{^\/?\d+-.*-for-(rent|lease).*$},
            }.freeze

            private

            def render
              {
                visitor: true,
                announcement: true,
                'announcement/index': true,
                "announcement/index/map": true,
              }
            end

            def links
              {
                'current/pl': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :pl).call,
                'current/en': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :en).call,
              }
            end

            def asset_names
              @asset_names ||= %i[
                check
                facebook
                phone
                chevron
                globe
                link
                arrowRight
                globe
                calendar
                apartment
                house
                room
                parkingSpace
                usablePremises
                office
                virtualOffice
                coworkingSpace
                advertisingSpaces
                facebook
                chevron
                close
                phone
                caretDown
              ]
            end

            def title
              @title ||= announcement.title(lang)
            end

            def description
              @description ||= announcement.description(lang)
            end

            def keywords
              @keywords ||= announcement.keywords(lang)
            end

            def image
              @image ||= announcement.image
            end

            def category
              nil
            end
          end
        end
      end
    end
  end
end
