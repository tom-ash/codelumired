# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        module Meta
          include ::Api::Tracks::Page::Shared::Breadcrumbs

          TRACK = 'page/edit'

          UNLOCALIZED_PATH = {
            pl: %r{^strony/.+$},
            en: %r{^pages/.+$}
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: '123123 Edytuj stronę',
            en: 'dsfsdfsdf Edit Page'
          }.freeze

          private

          def asset_names
            @asset_names ||= %i[
              chevron
              facebook_square
              linkedin_square
              twitter_square
              home
            ]
          end

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
              en: 'TODO'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'TODO',
              en: 'TODO'
            }.freeze
          end

          def render
            {
              visitor: true,
              page: true,
              'page/edit': true,
            }
          end

          def links
            {
              'current/pl': get_link_in_lang(:pl),
              'current/en': get_link_in_lang(:en),
            }
          end

          def get_link_in_lang(link_lang)
            page_in_lang = get_page_in_lang(link_lang)

            return if page_in_lang.nil?

            # TODO: Show the same page but only change the edit panel language.
            {
              href: "/#{page_in_lang.edit_link}",
              hrefLang: link_lang,
              title: page_in_lang.title,
              label: page_in_lang.title,
            }
          end

          def get_page_in_lang(lang_page)
            return page if lang_page == lang

            site::Page.find_by(lang: lang_page, lang_alts_group: lang_group_id)
          end

          def lang_group_id
            @lang_group_id ||= page.lang_alts_group
          end
        end
      end
    end
  end
end
