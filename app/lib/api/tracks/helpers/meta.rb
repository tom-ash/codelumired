# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Meta
        private

        def meta
          @meta ||= attrs[:meta]
        end

        def merge_meta
          meta.merge!(
            langs: langs,
            title: title,
            keywords: keywords,
            description: description,
            image: image,
            schema: schema,
            open_graph: open_graph,
            robots: robots,
            canonical_url: canonical_url,
            alternate_links: alternate_links,
          )
        end

        def langs
          @langs ||= attrs[:langs]
        end

        def title
          @title ||= unlocalized_title[lang]
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

        def schema
          @schema ||= ::Builders::SchemaOrg.new(schema_data).call
        end

        def open_graph
          @open_graph ||= ::Builders::OpenGraph.new(
            site_name: attrs[:site_name],
            url: full_url,
            title: title,
            description: description,
            keywords: keywords,
            image: image,
            locale: lang,
            locale_alts: langs,
          ).call
        end

        def robots
          @robots ||= 'index,follow,all'
        end

        def canonical_url
          @canonical_url ||= full_url
        end

        def alternate_links
          alternate_links_string = ''

          langs.map do |lang|
            href = links["current/#{lang}".to_sym][:path]
            alternate_links_string += "<link rel=\"alternate\" hreflang=\"#{lang}\" href=\"#{domain_url}#{href == '' ? '' : '/'}#{href}\" />"
          end

          alternate_links_string
        end

        def lang
          @lang ||= attrs[:lang].to_sym
        end

        def schema_data
          @schema_data ||= {
            url: full_url,
            title: title,
            description: description,
            keywords: keywords,
            image: image,
            lang: lang,
          }
        end
      end
    end
  end
end
