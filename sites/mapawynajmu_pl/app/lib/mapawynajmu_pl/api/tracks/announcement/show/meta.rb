# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            TRACK = 'announcement/show'

            LISTING_PL = '\d+-.*-na-wynajem.*'
            LISTING_EN = '\d+-.*-for-(rent|lease).*'

            PARTNER_PL = "partnerzy\/(?<partner_name>[^\/]*)(\/#{LISTING_PL})?"
            PARTNER_EN = "partners\/(?<partner_name>[^\/]*)(\/#{LISTING_EN})?"

            UNLOCALIZED_PATH = {
              pl: /^#{LISTING_PL}|#{PARTNER_PL}$/,
              en: /^#{LISTING_EN}|#{PARTNER_EN}$/,
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
                'current/pl': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(
                  announcement: announcement,
                  lang: :pl,
                ).call,
                'current/en': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(
                  announcement: announcement,
                  lang: :en,
                ).call,
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
                garage
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

            def match_data
              @match_data ||= UNLOCALIZED_PATH[lang].match(url)
            end

            def partner
              @partner ||= begin
                urlified_business_name = match_data && match_data[:partner_name]
                return if urlified_business_name.blank?

                ::MapawynajmuPl::User.find_by!(urlified_business_name: urlified_business_name)
              end
            end

            def partner_path(lang)
              {
                pl: "partnerzy/#{partner.urlified_business_name}",
                en: "partners/#{partner.urlified_business_name}",
              }[lang]
            end
          end
        end
      end
    end
  end
end
