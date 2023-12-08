# frozen_string_literal: true

module Api
  module Tracks
    module Common
      module Meta
        module SchemaOrg
          SCHEMA_ORG_CONTEXT = 'https://schema.org'
          SCHEMA_ORG_DEFAULT_TYPE = 'WebSite'

          private

          # TODO: Consider datePublished.
          # TODO: Consider dateModified.
          def schema_org
            @schema_org ||= {
              '@context': 'https://schema.org',
              "@graph": [
                organization,
                webSiteSchemaOrg,
              ].concat(webPageSchemaOrg),
            }
          end

          def organization
            @organization ||= ::Api::Tracks::Common::Meta::SchemaOrg::Organization.new(
              url: domain_url,
              name: organizationName,
              site: site,
            ).call
          end

          def webSiteSchemaOrg
            @webSiteSchemaOrg ||= {
              '@context': SCHEMA_ORG_CONTEXT,
              '@type': SCHEMA_ORG_DEFAULT_TYPE,
              'url': full_url,
              'inLanguage': lang,
              'name': title,
              'description': description,
              'keywords': keywords,
              'image': image,
              'isFamilyFriendly': true,
            }
          end

          def webPageSchemaOrg
            return [] if webPage.nil?

            [webPage]
          end

          def facebookPage
            @facebookPage ||= site::Api::Tracks::SocialPages::Facebook::Linker.new(lang).call[:href]
          end

          def linkedInPage
            @linkedInPage ||= site::Api::Tracks::SocialPages::Linkedin::Linker.new(lang).call[:href]
          end

          def webPage
            nil
          end
        end
      end
    end
  end
end
