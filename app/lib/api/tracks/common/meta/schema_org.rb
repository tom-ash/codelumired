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
                webSite,
              ],
            }
          end

          def organization
            @organization ||= ::Api::Tracks::Common::Meta::SchemaOrg::Organization.new(
              url: domain_url,
              name: organizationName,
              site: site,
            ).call
          end

          def webSite
            @webSite ||= {
              '@context': SCHEMA_ORG_CONTEXT,
              '@type': schema_org_type || SCHEMA_ORG_DEFAULT_TYPE,
              'url': full_url,
              'inLanguage': lang,
              'name': title,
              'description': description,
              'keywords': keywords,
              'image': image,
              'isFamilyFriendly': true,
            }
          end

          def schema_org_type
            nil
          end

          def facebookPage
            @facebookPage ||= site::Api::Tracks::SocialPages::Facebook::Linker.new(lang).call[:href]
          end

          def linkedInPage
            @linkedInPage ||= site::Api::Tracks::SocialPages::Linkedin::Linker.new(lang).call[:href]
          end
        end
      end
    end
  end
end
