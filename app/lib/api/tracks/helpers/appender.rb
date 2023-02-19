# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Appender
        include ::Api::Tracks::Helpers::State
        include ::Api::Tracks::Helpers::Meta

        class UnauthorizedError < StandardError; end

        def initialize(attrs)
          @attrs = attrs
        end

        def call
          authorize!
          merge_meta
          merge_state
        end

        private

        attr_reader :attrs

        def authorize!; end

        def lang
          @lang ||= attrs[:lang].to_sym
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

        def site
          @site ||= attrs[:site]
        end

        def constantized_site_name
          @constantized_site_name ||= attrs[:constantized_site_name]
        end

        def ssr?
          @ssr ||= attrs[:is_ssr]
        end

        def params
          @params ||= attrs[:params]
        end
      end
    end
  end
end
