# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'root' do
    include_context 'mapawynajmu_pl_sync'

    let(:route) { 'podbij-ogloszenie/1' }

    let(:visitor_app_data) do
      {
        lang: 'pl'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        announcement: true,
        listingBoost: true,
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
        allRightsReserved: '',
        showMyAccountMenuButtonLabel: 'Moje konto',
        signOutButtonLabel: 'Wyloguj',
      }
    end
    let(:visitor_assets) do
      {
        svgs: {},
      }
    end
    let(:visitor_links) do
      common_links.merge(
        'current/pl': {
          path: 'TODO',
          title: 'TODO',
        },
        'current/en': {
          path: 'TODO',
          title: 'TODO',
        },
      )
    end
    let(:visitor_control) { {} }
    let(:visitor_data) { {} }
    let(:visitor_inputs) { {} }
    let(:schemaOrg) do
      {
        inLanguage: 'pl',
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        url: 'http://local.mapawynajmu.pl:8080/podbij-ogloszenie/1',
        name: nil,
        description: nil,
        keywords: nil,
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        isFamilyFriendly: true
      }
    end
    let(:openGraph) do
      {
        locale: 'pl_PL',
        locales: ['pl_PL', 'en_GB'],
        url: 'http://local.mapawynajmu.pl:8080/podbij-ogloszenie/1',
        siteName: 'mapawynajmu.pl',
        type: 'website',
        title: nil,
        keywords: nil,
        description: nil,
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        'image:width': 1200,
        'image:height': 630,
      }
    end
    let(:meta) do
      {
        lang: 'pl',
        langs: ['pl', 'en'],
        title: nil,
        keywords: nil,
        description: nil,
        image: 'https://mapawynajmupl.s3.eu-central-1.amazonaws.com/assets/images/mapawynajmupl.jpg',
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.mapawynajmu.pl:8080/podbij-ogloszenie/1',
        alternateLinks: '<link rel="alternate" hreflang="pl" href="http://local.mapawynajmu.pl:8080/TODO" /><link rel="alternate" hreflang="en" href="http://local.mapawynajmu.pl:8080/TODO" />',
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
