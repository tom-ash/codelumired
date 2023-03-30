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

            # def links
            #   {
            #     'page/edit': { path: page.edit_link },
            #     'current/pl': { path: nil },
            #     'current/en': { path: nil },
            #   }.merge(page_lang_alts_links)
            # end

            # def page_lang_alts_links
            #   page_lang_alts = site::Page.where(lang_alts_group: page.lang_alts_group)

            #   page_lang_alts.each_with_object({}) do |group_page, link_object|
            #     link_object["current/#{group_page.lang}".to_sym] = {
            #       path: group_page.edit_link,
            #       title: group_page.title,
            #     }
            #   end
            # end

            # def asset_names
            #   # TODO: Fix!
            #   @asset_names ||= []
            # end
          end
        end
      end
    end
  end
end
