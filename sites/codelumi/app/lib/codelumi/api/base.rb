# frozen_string_literal: true

module Codelumi
  module Api
    class Base < ::Api::Base
      SITENAME = 'Codelumi'
      SITE_TITLE = 'soundof.IT'
      PAGE_LANGS = %w[pl en].freeze

      helpers do
        def site_name
          @site_name ||= SITENAME
        end

        def site_title
          @site_title ||= SITE_TITLE
        end

        def page_langs
          @page_langs ||= PAGE_LANGS
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::Codelumi::Api::Sync => 'sync'
    end
  end
end
