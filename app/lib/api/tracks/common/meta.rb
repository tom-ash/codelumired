# frozen_string_literal: true

module Api
  module Tracks
    module Common
      module Meta
        include ::Api::Tracks::Common::Meta::OpenGraph
        include ::Api::Tracks::Common::Meta::SchemaOrg

        private

        def merge_meta
          meta.merge!(
            primary_meta,
            langs: langs,
            schema_org: schema_org,
            open_graph: open_graph,
            robots: robots,
            canonical_url: canonical_url,
            alternateLangLinks: alternateLangLinks,
            **author,
          )
        end

        def meta
          @meta ||= attrs[:meta]
        end

        def primary_meta
          @primary_meta ||= {
            title: title,
            keywords: keywords,
            description: description,
            image: image,
          }
        end

        def langs
          @langs ||= attrs[:langs]
        end

        def title
          @title ||= unlocalized_title[lang]
        end

        def author
          @author ||= {}
        end

        def keywords
          @keywords ||= unlocalized_keywords[lang]
        end

        def description
          @description ||= unlocalized_description[lang]
        end

        def image
          @image ||= attrs[:image]
        end

        def robots
          @robots ||= 'index,follow,all'
        end

        def canonical_url
          @canonical_url ||= full_url
        end

        def alternateLangLinks
          langLinks = []

          langs.map do |lang|
            langLink = links["current/#{lang}".to_sym]

            if langLink.present?
              langLinks.push(
                href: "#{domain_url}#{langLink[:href]}",
                hrefLang: lang,
              )
            end
          end

          langLinks if langLinks.length > 1
        end

        def site_name
          @site_name ||= attrs[:site_name]
        end
      end
    end
  end
end
