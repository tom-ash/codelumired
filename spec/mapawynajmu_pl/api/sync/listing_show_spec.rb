# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'root' do
    include_context 'mapawynajmu_pl_sync'

    let(:listing) { create(:mapawynajmu_pl_listing, user: user) }
    let(:listing_id) { listing.id }
    let(:route) { "#{listing_id}-biuro-na-wynajem" }

    let(:visitor_app_data) do
      {
        lang: 'pl'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        announcement: true,
        'listings/show': true,
      }
    end
    let(:visitor_user) do
      {
        authorized: false,
        accountType: nil,
        role: nil
      }
    end
    let(:visitor_texts) do
      {
        categoryInputPlaceholder: 'Kategoria',
        areaInputPlaceholder: 'Powierzchnia',
        areaMinInputLabel: 'Min.',
        areaMaxInputLabel: 'Maks.',
        priceInputPlaceholder: 'Miesięczna cena',
        priceMinInputLabel: 'Min.',
        priceMaxInputLabel: 'Maks.',
        officesCategoryLabel: 'Biura',
        usablePremisesCategoryLabel: 'Lokale użytkowe',
        apartmentsCategoryLabel: 'Mieszkania',
        housesCategoryLabel: 'Domy',
        roomsCategoryLabel: 'Pokoje',
        parkingSpacesCategoryLabel: 'Miejsca parkingowe',
        virtualOfficesCategoryLabel: 'Biura Wirtualne',
        coworkingSpacesCategoryLabel: 'Coworking - Przestrzenie coworkingowe',
        advertisingSpacesCategoryLabel: 'Przestrzenie reklamowe',
        garagesCategoryLabel: 'Garaże',
        signOutButtonLabel: 'Wyloguj',
        showMyAccountMenuButtonLabel: 'Moje konto',
        allRightsReserved: '',
        placesAutocompleteInputPlaceholder: 'Lokalizacja'
      }
    end
    let(:visitor_assets) do
      {
        # TODO!: Add assets.
        svgs: {},
      }
    end
    let(:visitor_links) do
      common_links.merge(
        'current/pl': {
          href: "/#{listing_id}-biuro-na-wynajem",
        },
        'current/en': {
          href: "/#{listing_id}-office-for-lease",
        },
        'listing/index/go-back': {
          href: '/',
        },
        'listing/index/offices': {
          href: '/wynajem/biura',
        },
        'listing/index/usablePremises': {
          href: '/wynajem/lokale-uzytkowe',
        },
        'listing/index/apartments': {
          href: '/wynajem/mieszkania',
        },
        'listing/index/houses': {
          href: '/wynajem/domy',
        },
        'listing/index/rooms': {
          href: '/wynajem/pokoje',
        },
        'listing/index/parkingSpaces': {
          href: '/wynajem/miejsca-parkingowe',
        },
        'listing/index/virtualOffices': {
          href: '/wynajem/biura-wirtualne',
        },
        'listing/index/coworkingSpaces': {
          href: '/wynajem/coworking-przestrzenie-coworkingowe',
        },
        'listing/index/advertisingSpaces': {
          href: '/wynajem/przestrzenie-reklamowe',
        },
        'listing/index/garages': {
          href: '/wynajem/garaze',
        },
      )
    end
    let(:visitor_control) do
      {
        areaFilterPanel: false,
        categoryFilterPanel: false,
        currentTileId: listing_id.to_s,
        isPinsDrawn: false,
        mapOptions: {
          center: {
            lat: 50.9129256,
            lng: 16.432166
          },
          zoom: 12.4,
        },
        isSSR: false,
      }
    end
    let(:visitor_data) do
      {
        :currentCategory=>nil,
        :tile=>{
          id: listing_id,
          category: 0,
          area: nil,
          pictures: [
            {
              database: 'test_test_test',
            },
          ],
          longitude: 16.432166,
          latitude: 50.9129256,
          rentCurrency: nil,
          netRentAmount: nil,
          netRentAmountPerSqm: nil,
          grossRentAmount: nil,
          grossRentAmountPerSqm: nil,
          rooms: nil,
          floor: nil,
          totalFloors: nil,
          availabilityDate: nil,
          features: nil,
          furnishings: nil,
          polishDescription: nil,
          englishDescription: nil,
          locality: nil,
          sublocality: nil,
          name: nil,
          link: nil,
          isPromoted: false,
          phone: '+48 100',
          title: 'Biuro do wynajęcia',
        },
        :announcements=>[],
        :amount=>0,
        :categorySvgName=>"list",
        :areaSvgName=>"area",
        :priceSvgName=>"coins",
        articles: [],
        currentListingId: listing.id,
      }
    end
    let(:visitor_inputs) do
      {
        category: nil,
        areaOptions: ['20', '30', '40', '50', '60', '70', '80', '90', '100', '150', '200'],
        area: '',
        areaMin: nil,
        areaMax: nil,
        priceOptions: ['1000', '1500', '2000', '2500', '3000', '4000', '5000', '6000', '7000', '8000', '9000', '10000'],
        price: '',
        priceMin: nil,
        priceMax: nil,
        lat: nil,
        lng: nil,
        location: nil,
      }
    end
    let(:schemaOrg) do
      {
        '@context': 'https://schema.org',
        '@graph': [
          {
            :@type=>"Organization",
            :name=>"mapawynajmu.pl",
            :sameAs=>[
              "https://www.facebook.com/mapawynajmupl",
              "https://www.linkedin.com/company/mapawynajmu-pl/"
            ],
            :url=>"http://local.mapawynajmu.pl:8080"
          },
          {
            :@context=>"https://schema.org",
            :@type=>"WebSite",
            :description=>"Biuro do wynajęcia o miesięcznej cenie  PLN. | mapawynajmu.pl - ogłoszenia wynajmu nieruchomości.",
            :image=>"/announcements/#{listing_id}/test_test_test",
            :inLanguage=>"pl",
            :isFamilyFriendly=>true,
            :keywords=>"biuro, , , wynajem, wynajmu, najem, najmu, wynajęcie, wynajęcia",
            :name=>"Biuro do wynajęcia",
            :url=>"http://local.mapawynajmu.pl:8080/#{listing_id}-biuro-na-wynajem"
          },
          {
            '@type': 'RealEstateListing',
            datePosted: listing.created_at.iso8601,
            name: 'Biuro do wynajęcia',
            url: "#{listing_id}-biuro-na-wynajem",
            # mainContentOfPage,
            # primaryImageOfPage,
            # speakable,
            # about,
            # dateCreated,
            # dateModified,
            # datePublished,
            # expires,
            # inLanguage,
            # headline,
            # isFamilyFriendly,
            # isPartOf,
            # mainEntity,
            # text,
            # thumbnail,
            # url,
          },
        ],
      }
    end
    let(:openGraph) do
      {
        title: 'Biuro do wynajęcia',
        keywords: 'biuro, , , wynajem, wynajmu, najem, najmu, wynajęcie, wynajęcia',
        description: "Biuro do wynajęcia o miesięcznej cenie  PLN. | mapawynajmu.pl - ogłoszenia wynajmu nieruchomości.", image: "/announcements/#{listing_id}/test_test_test",
        siteName: 'mapawynajmu.pl',
        url: "http://local.mapawynajmu.pl:8080/#{listing_id}-biuro-na-wynajem",
        type: 'website',
        locale: 'pl_PL',
        'image:width': 1200,
        'image:height': 630,
        locales: [
          'pl_PL',
          'en_GB',
        ],
      }
    end
    let(:meta) do
      {
        lang: 'pl',
        langs: [
          'pl',
          'en'
        ],
        title: 'Biuro do wynajęcia',
        keywords: 'biuro, , , wynajem, wynajmu, najem, najmu, wynajęcie, wynajęcia',
        description: 'Biuro do wynajęcia o miesięcznej cenie  PLN. | mapawynajmu.pl - ogłoszenia wynajmu nieruchomości.',
        image: "/announcements/#{listing_id}/test_test_test",
        robots: 'index,follow,all',
        canonicalUrl: "http://local.mapawynajmu.pl:8080/#{listing_id}-biuro-na-wynajem",
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        alternateLangLinks: [
          {
            :href=>"http://local.mapawynajmu.pl:8080/#{listing_id}-biuro-na-wynajem",
            :hrefLang=>"pl"
          },
          {
            :href=>"http://local.mapawynajmu.pl:8080/#{listing_id}-office-for-lease",
            :hrefLang=>"en"
          },
        ],
      }
    end
    let(:user_user) do
      {
        accountType: nil, # TODO: Fix nil!
        authorized: true, # TODO: Change to authenticated.
        role: nil,
      }
    end
    let(:admin_user) do
      {
        accountType: nil, # TODO: Fix nil!
        authorized: true, # TODO: Change to authenticated.
        role: 'admin',
      }
    end
    let(:visitor_status) { 200 }
  end
end
