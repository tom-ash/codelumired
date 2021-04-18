# frozen_string_literal: true

module Codelumi
  module Api
    class Base < ::Api::Base
      SITENAME = 'Codelumi'
      PAGE_LANGS = %w[pl en].freeze

      helpers do
        def site_name
          @site_name ||= SITENAME
        end

        def page_langs
          @page_langs ||= PAGE_LANGS
        end
      end

      mount ::Codelumi::Api::Sync => 'sync'
    end
  end
end
