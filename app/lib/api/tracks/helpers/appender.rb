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
          merge_meta
          merge_render
          merge_links
          merge_assets
          merge_page
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
            langs: langs,
            title: title,
            keywords: keywords,
            description: description,
            image: image,
            schema: schema,
            open_graph: open_graph,
            robots: robots,
            canonical_url: canonical_url,
            alternate_links: alternate_links
          )
        end

        def alternate_links
          return if alt_langs.blank?

          alternate_links_string = ''

          alt_langs.map do |alt_lang|
            href = links["current/#{alt_lang}".to_sym][:path]
            alternate_links_string += "<link rel=\"alternate\" hreflang=\"#{alt_lang}\" href=\"#{domain_url}#{href == '' ? '' : '/'}#{href}\" />"
          end

          alternate_links_string
        end

        def robots
          @robots ||= 'index,follow,all'
        end

        def canonical_url
          @canonical_url ||= full_url
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
            locale_alts: alt_langs
          ).call
        end

        def merge_assets
          state.merge!('assets/svgs': assets)
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
            url: full_url,
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

        def domain_url
          @domain_url ||= attrs[:domain_url]
        end

        def full_url
          @full_url ||= domain_url + (url == '/' ? '' : "/#{url}")
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

        def description
          @description ||= unlocalized_description[lang]
        end

        def keywords
          @keywords ||= unlocalized_keywords[lang]
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

        def image
          # TODO: Add for other sites.
          @image ||= 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg'
        end
      end
    end
  end
end
