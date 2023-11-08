# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'root' do
    include_context 'mapawynajmu_pl_sync'

    let(:route) { '/' }

    let(:visitor_app_data) do
      {
        lang: 'pl'
      }
    end
    let(:visitor_render) do
      {
        "visitor": true,
        "announcement": true,
        "announcement/index": true,
        "announcement/index/map": true
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
        svgs: {}
      }
    end
    let(:visitor_links) do
      common_links.merge(
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
        'current/pl': {
          href: '/',
        },
        'current/en': {
          href: '/en',
        },
      )
    end
    let(:visitor_control) do
      {
        categoryFilterPanel: false,
        areaFilterPanel: false,
        isPinsDrawn: false
      }
    end
    let(:visitor_data) do
      {
        currentCategory: nil,
        currentPartnerName: nil,
        title: 'Mapa wynajmu nieruchomości w Polsce',
        tile: nil,
        announcements: [],
        amount: 0,
        categorySvgName: 'list',
        areaSvgName: 'area',
        priceSvgName: 'coins'
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
        inLanguage: 'pl',
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        url: 'http://local.mapawynajmu.pl:8080',
        name: 'Mapa wynajmu nieruchomości w Polsce',
        description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
        keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        isFamilyFriendly: true,
      }
    end
    let(:openGraph) do
      {
        locale: 'pl_PL',
        locales: ['pl_PL', 'en_GB'],
        url: 'http://local.mapawynajmu.pl:8080',
        siteName: 'mapawynajmu.pl',
        type: 'website',
        title: "Mapa wynajmu nieruchomości w Polsce",
        keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
        description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        'image:width': 1200,
        'image:height': 630,
      }
    end
    let(:meta) do
      {
        lang: 'pl',
        langs: ['pl', 'en'],
        title: 'Mapa wynajmu nieruchomości w Polsce',
        keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
        description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.mapawynajmu.pl:8080',
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        alternateLangLinks: [
          {
            href: 'http://local.mapawynajmu.pl:8080/',
            hrefLang: 'pl',
          },
          {
            href: 'http://local.mapawynajmu.pl:8080/en',
            hrefLang: 'en',
          }
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
