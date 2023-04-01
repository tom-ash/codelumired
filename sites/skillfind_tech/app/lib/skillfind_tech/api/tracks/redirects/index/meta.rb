# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Redirects
        module Index
          module Meta
            def links
              {
                'current/pl': ::SkillfindTech::Api::Tracks::Redirects::Index::Linker.new(:pl).call,
                'current/en': ::SkillfindTech::Api::Tracks::Redirects::Index::Linker.new(:en).call,
              }
            end

            TRACK = 'redirectsIndex'

            UNLOCALIZED_PATH = {
              pl: 'przekierowania',
              en: 'redirects',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Przekierowania',
              en: 'Redirects',
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'TODO',
                en: 'TODO',
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'TODO',
                en: 'TODO',
              }.freeze
            end

            def render
              {
                visitor: true,
                redirects: true,
                redirectsIndex: true,
              }
            end
          end
        end
      end
    end
  end
end
