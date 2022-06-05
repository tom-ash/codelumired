# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Appender
        class UnauthorizedError < StandardError; end

        def initialize(attrs)
          @attrs = attrs
        end

        def call
          authorize!
          merge_state
          merge_render
          merge_links
          merge_meta
          merge_assets
          merge_locale
          merge_page
          merge_langs
          merge_canonical_url
        end

        private

        attr_reader :attrs

        def authorize!; end

        def merge_state; end

        def merge_render
          state.merge!(render: render)
        end

        def merge_links
          state.merge!(links: links)
        end

        def merge_meta
          meta.merge!(
            title: title,
            keywords: keywords,
            description: description,
            image: image,
            schema: schema
          )
        end

        def merge_assets
          state.merge!('assets/svgs': assets)
        end

        def merge_locale
          meta.merge!(
            og_locale: og_locale,
            og_locale_alts: og_locale_alts
          )
        end

        def og_locale
          og_unlocalized_locale[lang]
        end

        def og_locale_alts
          alt_langs.map { |alt_lang| og_unlocalized_locale[alt_lang] }
        end

        def og_unlocalized_locale
          @og_unlocalized_locale ||= {
            pl: :pl_pl,
            en: :en_us
          }
        end

        def alt_langs
          @alt_langs ||= langs.reject { |alt_lang| alt_lang == lang }
        end

        def render
          {}
        end

        def links
          {}
        end

        def lang
          @lang ||= attrs[:lang].to_sym
        end

        def langs
          @langs ||= attrs[:langs]
        end

        def state
          @state ||= attrs[:state] || {}
        end

        def meta
          @meta ||= attrs[:meta]
        end

        def schema
          @schema ||= ::Builders::SchemaOrg.new(schema_data).call
        end

        def schema_data
          @schema_data ||= {
            url: 'TODO',
            title: title,
            description: description,
            keywords: keywords,
            image: image,
            lang: lang
          }
        end

        def current_user
          @current_user ||= attrs[:current_user]
        end

        def url
          @url ||= attrs[:url]
        end

        def params
          @params ||= attrs[:params]
        end

        def site
          @site ||= attrs[:site]
        end

        def constantized_site_name
          @constantized_site_name ||= attrs[:constantized_site_name]
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

        def lang_counterpart
          @lang_counterpart ||= lang == :pl ? :en : :pl
        end

        def merge_page
          return if show_page.blank?

          state.merge!(
            'page/show/data': page_data,
            'render': state[:render].merge(page: true, 'page/show': true)
          )
        end

        def show_page
          @show_page ||= begin
            return if page_name.blank?

            site::Page.find_by(name: page_name, lang: lang)
          end
        end

        def page_data
          ::Serializers::Page::Show.new(page: show_page, constantized_site_name: constantized_site_name).call
        end

        def page_name
          nil
        end

        def assets
          ::MapawynajmuPl::Asset.where(name: asset_names).each_with_object({}) do |svg, serialized_svgs|
            serialized_svgs[svg.name.to_s] = svg.data
          end
        end

        def asset_names
          @asset_names ||= []
        end

        def merge_langs
          meta.merge!(
            langs: langs
          )
        end

        def merge_canonical_url
          return if canonical_url.nil?

          meta.merge!(
            canonical_url: canonical_url
          )
        end

        def canonical_url
          nil
        end

        def image
          # TODO: Add for other sites.
          @image ||= 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg'
        end
      end
    end
  end
end
