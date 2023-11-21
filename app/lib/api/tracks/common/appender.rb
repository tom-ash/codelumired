# frozen_string_literal: true

module Api
  module Tracks
    module Common
      class Appender
        include ::Api::Tracks::Common::State
        include ::Api::Tracks::Common::Meta

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

        def authenticated_user
          @authenticated_user ||= attrs[:authenticated_user]
        end

        # TODO: This is path!
        def url
          @url ||= attrs[:url]
        end

        # TODO: This is just domain!
        def domain_url
          @domain_url ||= attrs[:domain_url]
        end

        def api_url
          @api_url ||= attrs[:api_url]
        end

        # TODO: This is just url!
        def full_url
          @full_url ||= domain_url + (url == '/' ? '' : "/#{url}")
        end

        def site
          @site ||= attrs[:site]
        end

        def constantized_site_name
          @constantized_site_name ||= attrs[:constantized_site_name]
        end

        def organizationName
          @organizationName ||= attrs[:organizationName]
        end

        def ssr?
          @ssr ||= attrs[:is_ssr]
        end

        def params
          @params ||= attrs[:params]
        end

        def request_ip
          @request_ip ||= attrs[:request_ip]
        end

        def getTexts(path)
          JSON.parse(File.read(path)).deep_symbolize_keys
        end
      end
    end
  end
end
