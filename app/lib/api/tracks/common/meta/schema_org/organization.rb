# frozen_string_literal: true

module Api
  module Tracks
    module Common
      module Meta
        module SchemaOrg
          class Organization
            TYPE = 'Organization'

            def initialize(attrs)
              @url = attrs[:url]
              @name = attrs[:name]
              @site = attrs[:site]
            end

            def call
              {
                '@type': TYPE,
                url: url,
                name: name,
                sameAs: [
                  facebookPage,
                  linkedInPage,
                ],
              }
            end

            private

            attr_reader :url, :name, :site

            def facebookPage
              @facebookPage ||= site::Api::Tracks::SocialPages::Facebook::Linker.new(:en).call[:href]
            end

            def linkedInPage
              @linkedInPage ||= site::Api::Tracks::SocialPages::Linkedin::Linker.new(:en).call[:href]
            end
          end
        end
      end
    end
  end
end
