# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Appender
        def initialize(attrs)
          @attrs = attrs
        end

        def call
          merge_state
          merge_render
          merge_links
          merge_meta
          merge_assets
          merge_page
        end

        private

        attr_reader :attrs

        def merge_state; end

        def merge_render
          state.merge!(render: render)
        end

        def merge_links
          state.merge!(links: links)
        end

        def merge_assets
          state.merge!('assets/svgs': assets)
        end

        def render
          {}
        end

        def links
          {}
        end

        def merge_meta
          meta.merge!(
            title: title,
            keywords: keywords,
            description: description
          )
        end

        def lang
          @lang ||= attrs[:lang].to_sym
        end

        def state
          @state ||= attrs[:state] || {}
        end

        def meta
          @meta ||= attrs[:meta]
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

        def site_name
          @site_name ||= attrs[:site_name]
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
          return if page.blank?

          state.merge!(
            'page/show/data': page_data,
            'render': state[:render].merge(page: true, 'page/show': true)
          )
        end

        def page
          @page ||= begin
            return if page_name.blank?

            site::Page.find_by(name: page_name, lang: lang)
          end
        end

        def page_data
          ::Serializers::Page::Show.new(page: page, site_name: site_name).call
        end

        def page_name
          nil
        end

        def assets
          ::Warsawlease::Asset.where(name: asset_names).each_with_object({}) do |svg, serialized_svgs|
            serialized_svgs[svg.name.to_s] = svg.data
          end
        end

        def asset_names
          @asset_names ||= []
        end
      end
    end
  end
end
