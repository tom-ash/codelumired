# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            include ::MapawynajmuPl::Api::Tracks::Announcement::Common::PartnerAndCategory

            TRACK = 'announcement/show'

            LISTING_PL = '\d+-.*-na-wynajem.*'
            LISTING_EN = '\d+-.*-for-(rent|lease).*'

            PARTNER_PL = "partnerzy\/(?<current_partner_name>[^\/]*)(\/#{LISTING_PL})?"
            PARTNER_EN = "partners\/(?<current_partner_name>[^\/]*)(\/#{LISTING_EN})?"

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
                'listing/index/go-back': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(
                  lang: lang,
                  url: url
                ).go_back_link,
              }
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

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end
          end
        end
      end
    end
  end
end
