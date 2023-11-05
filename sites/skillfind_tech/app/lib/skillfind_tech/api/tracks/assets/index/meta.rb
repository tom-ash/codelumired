# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Assets
        module Index
          module Meta
            def links
              {
                'current/pl': ::SkillfindTech::Api::Tracks::Assets::Index::Linker.new(:pl).call,
                'current/en': ::SkillfindTech::Api::Tracks::Assets::Index::Linker.new(:en).call,
              }
            end

            TRACK = 'assetsIndex'

            UNLOCALIZED_PATH = {
              pl: 'assety',
              en: 'assets',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Assety',
              en: 'Assets',
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
                assets: true,
                assetsIndex: true,
              }
            end
          end
        end
      end
    end
  end
end
