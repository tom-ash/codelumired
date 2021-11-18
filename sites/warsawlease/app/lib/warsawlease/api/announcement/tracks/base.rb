# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        class Base
          def initialize(url:, lang:, params:, current_user:, state:, meta:)
            @url = url
            @lang = lang.to_sym
            @params = params
            @current_user = current_user
            @state = state
            @meta = meta
          end

          private

          attr_reader :url, :params, :lang, :current_user, :state, :meta

          def title
            unlocalized_title[lang]
          end

          def keywords
            unlocalized_keywords[lang]
          end

          def description
            unlocalized_description[lang]
          end
        end
      end
    end
  end
end
