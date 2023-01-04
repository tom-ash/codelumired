# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        module Meta
          TRACK = 'page/show'

          private

          def render
            {
              visitor: true,
              page: true,
              'page/show': true
            }
          end

          def links
            {
              'page/edit': { path: page.edit_link },
              'current/pl': { path: nil },
              'current/en': { path: nil }
            }.merge(page_lang_alts_links)
          end

          def page_lang_alts_links
            page_lang_alts = site::Page.where(lang_alts_group: page.lang_alts_group)

            page_lang_alts.each_with_object({}) do |group_page, link_object|
              link_object["current/#{group_page.lang}".to_sym] = {
                path: group_page.show_link,
                title: group_page.title
              }
            end
          end

          def asset_names
            @asset_names ||= %i[
              chevron
            ]
          end

          def title
            @title ||= page.title
          end

          def description
            @description ||= page.description
          end

          def keywords
            @keywords ||= page.keywords
          end

          def image
            @image ||= page.cover_image
          end

          def schema
            @schema ||= JSON.pretty_generate(page.schema_mode == 'auto' ? page.auto_schema : page.manual_schema)
          end
        end
      end
    end
  end
end
