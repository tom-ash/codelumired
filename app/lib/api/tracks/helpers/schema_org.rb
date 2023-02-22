# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module SchemaOrg
        SCHEMA_ORG_CONTEXT = 'https://schema.org'
        SCHEMA_ORG_DEFAULT_TYPE = 'WebSite'

        private

        # TODO: Consider datePublished.
        # TODO: Consider dateModified.
        def schema_org
          @schema_org ||= {
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

        def schema_data
          @schema_data ||= {
            **primary_meta,
            url: full_url,
            lang: lang,
          }
        end

        def schema_org_type
          nil
        end
      end
    end
  end
end
