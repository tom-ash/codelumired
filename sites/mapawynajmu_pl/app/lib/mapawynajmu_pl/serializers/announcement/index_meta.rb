# frozen_string_literal: true

module MapawynajmuPl
  module Serializers
    module Announcement
      class IndexMeta
        DEFAULT_IMAGE = 'https://warsawlease.s3.eu-central-1.amazonaws.com/assets/mapa-wynajmu-nieruchomosci-w-warszawie.png'

        def initialize(track:, lang:, track_meta_data:)
          @track = track
          @lang = lang
          @track_meta_data = track_meta_data
        end

        def call
          return {} if components.nil?

          lang == 'pl' ? polish_meta : english_meta
        end

        private

        attr_reader :track, :lang, :track_meta_data

        def components
          @components ||= track_meta_data.dig(track.sub(%r{/(map|catalogue)}, ''), lang)
        end

        def polish_meta
          nominative = components['nominative']
          genitive = components['genitive']
          venue = track.include?('map') ? 'Mapa' : 'Katalog'

          {
            title: "#{nominative} na wynajem w Warszawie - #{venue} - bezpłatne ogłoszenia",
            keywords: "#{nominative.downcase}, wynajem, warszawa, #{venue.downcase}, bezpłatne, darmowe, ogłoszenia",
            description: "#{nominative} na wynajem w Warszawie - #{venue} - bezpłatne ogłoszenia. Przeglądaj i dodawaj darmowe ogłoszenia wynajmu #{genitive} w Warszawie.",
            image: DEFAULT_IMAGE
          }
        end

        def english_meta
          nominative = components['nominative']
          venue = track.include?('map') ? 'Map' : 'Catalogue'

          {
            title: "#{nominative} for Lease in Warsaw - #{venue} - Free Announcements",
            keywords: "#{nominative.downcase}, lease, warsaw, #{venue.downcase}, free, announcements",
            description: "#{nominative} for lease in Warsaw - #{venue} - free announcements. Search and add free announcements of lease of #{nominative} in Warsaw.",
            image: DEFAULT_IMAGE
          }
        end
      end
    end
  end
end
