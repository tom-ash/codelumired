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
                primary_schema.merge(author_schema),
                breadcrumbs,
              ]
            }
          end

          def primary_schema
            @primary_schema ||= {
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

          def author_schema
            @author_schema ||= {
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

          def breadcrumbs
            @breadcrumbs ||= {
              "@type": "BreadcrumbList",
              "itemListElement": [
                {
                  "@type": "ListItem",
                  "position": 1,
                  "name": "Strona główna",
                  "item": "https://mapawynajmu.pl"
                },
              ].concat(breadcrumb_parents)
            }
          end

          def breadcrumb_parents
            @breadcrumb_parents ||= begin
              parents = []

              obtain_breadcrumb_parents(parents, page)

              parents
            end
          end

          def obtain_breadcrumb_parents(parents, page)
            if (page.parent_id)
              parent = site::Page.find(page.parent_id)

              parents.push({
                  "@type": "ListItem",
                  "position": parents.length + 2,
                  "name": parent.title,
                  "item": "#{domain_url}/#{parent.url}"
              })

              obtain_breadcrumb_parents(parents, parent)
            end
          end
        end
      end
    end
  end
end
