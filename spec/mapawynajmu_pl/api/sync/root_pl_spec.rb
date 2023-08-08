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
        allRightsReserved: ''
      }
    end
    let(:visitor_assets) do
      {
        svgs: {}
      }
    end
    let(:visitor_control) do
      {
        isMapInitialized: false,
        shouldInitializeMap: false,
        isPinsDrawn: false,
        mapOptions: {
          center: {
            lat: 52,
            lng: 19,
          },
          zoom: 6.7,
        },
        categoryFilterPanel: false,
        areaFilterPanel: false
      }
    end
    let(:visitor_data) do
      {
        currentCategory: nil,
        currentPartnerName: nil,
        title: 'Nieruchomości na wynajem',
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
        priceMax: nil
      }
    end
    let(:schemaOrg) do
      {
        inLanguage: 'pl',
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        url: 'http://local.mapawynajmu.pl:8080',
        name: 'Nieruchomości na wynajem',
        description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
        keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        isFamilyFriendly: true
      }
    end
    let(:openGraph) do
      {
        locale: 'pl_PL',
        locales: ['pl_PL', 'en_GB'],
        url: 'http://local.mapawynajmu.pl:8080',
        siteName: 'mapawynajmu.pl',
        type: 'website',
        title: "Nieruchomości na wynajem",
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
        title: 'Nieruchomości na wynajem',
        keywords: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
        description: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.mapawynajmu.pl:8080',
        alternateLinks: '<link rel="alternate" hreflang="pl" href="http://local.mapawynajmu.pl:8080" /><link rel="alternate" hreflang="en" href="http://local.mapawynajmu.pl:8080/en" />',
        schemaOrg: schemaOrg,
        openGraph: openGraph,
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
