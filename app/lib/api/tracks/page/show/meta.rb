# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        module Meta
          include ::Api::Tracks::Page::Shared::Breadcrumbs

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
              'page/edit': page_edit_link,
              'current/pl': get_link_in_lang(:pl),
              'current/en': get_link_in_lang(:en),
            }
          end

          def page_edit_link
            {
              href: page.edit_link
            }
          end

          def get_link_in_lang(link_lang)
            page_in_lang = get_page_in_lang(link_lang)

            return if page_in_lang.nil?

            {
              href: "/#{page_in_lang.url}",
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

          def author
            @author ||= {
              author: author_name
            }
          end

          def description
            @description ||= page.description
          end

          def keywords
            @keywords ||= page.keywords
          end

          def schema_org
            @schema_org ||= {
              '@context': 'https://schema.org',
              "@graph": [
                primarySchemaOrg.merge(authorSchemaOrg),
                breadcrumbsSchemaOrg,
              ]
            }
          end

          def primarySchemaOrg
            @primarySchemaOrg ||= {
              '@type': 'Article', # TODO: Handle other types.
              inLanguage: page.lang,
              name: page.title,
              description: page.description,
              keywords: page.keywords,
              datePublished: page.published_on,
              dateModified: page.modified_on,
              url: "#{domain_url}/#{page.url}",
              isFamilyFriendly: true,
              image: page.cover_image
            }
          end

          def authorSchemaOrg
            @authorSchemaOrg ||= {
              author: {
                '@type': 'Person',
                name: author_name,
              }.merge(author_additional_schema)
            }
          end

          def author_name
            @author_name ||= "#{page.user.first_name} #{page.user.last_name}"
          end

          def author_additional_schema
            @author_additional_data ||= begin
              author_data = page.user.author_data

              return {} if author_data.nil?

              {
                url: author_data['url'],
                jobTitle: author_data['jobTitle'],
                honorificPrefix: author_data['honorificPrefix'],
              }
            end
          end

          def breadcrumbsSchemaOrg
            @breadcrumbsSchemaOrg ||= begin
              itemListElement = breadcrumbs.each_with_index.map do |breadcrumb, index|
                {
                  '@type': 'ListItem',
                  position: index + 1,
                  name: breadcrumb[:name],
                  item: "#{domain_url}#{breadcrumb[:item]}",
                }
              end

              {
                "@type": "BreadcrumbList",
                "itemListElement": itemListElement,
              }
            end
          end
        end
      end
    end
  end
end
