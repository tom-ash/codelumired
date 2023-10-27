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
              'page/show': true,
            }
          end

          def links
            {
              'page/edit': { path: page.edit_link },
              'current/pl': { path: nil },
              'current/en': { path: nil },
            }.merge(page_lang_alts_links)
          end

          def page_lang_alts_links
            page_lang_alts = site::Page.where(lang_alts_group: page.lang_alts_group)

            page_lang_alts.each_with_object({}) do |group_page, link_object|
              path = group_page.show_link
              href = "#{protocol_and_domain}/#{path}"

              link_object["current/#{group_page.lang}".to_sym] = {
                href: href,
                path: path,
                title: group_page.title,
              }
            end
          end

          def asset_names
            @asset_names ||= %i[
              chevron
              facebook_square
              linkedin_square
              twitter_square
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

          def schema_org
            @schema_org ||= primary_schema_org.merge(author_schema_org)
          end

          def primary_schema_org
            @primary_schema_org ||= page.schema_mode == 'auto' ? page.auto_schema : page.manual_schema
          end

          def author_schema_org
            {
              author: {
                '@type': 'Person',
                name: "#{page.user.first_name} #{page.user.last_name}",
              }.merge(page.user.author_data || {})
            }
          end
        end
      end
    end
  end
end
