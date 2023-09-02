# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'root' do
    include_context 'mapawynajmu_pl_sync'

    let(:listing) { create(:mapawynajmu_pl_listing, user: user) }
    let(:listing_id) { listing.id }
    let(:route) { "wyroznij-ogloszenie/#{listing_id}" }

    let(:get_response_body) do
      "{\"access_token\":\"c8e9964f-3727-4e07-91b6-71fd3a1e0e7d\",\"token_type\":\"bearer\",\"expires_in\":43199,\"grant_type\":\"client_credentials\"}"
    end
    let(:post_response_body) do
      "{\"status\":{\"statusCode\":\"SUCCESS\"},\"redirectUri\":\"https://merch-prod.snd.payu.com/pay/?orderId=KZTM26DF9Q230813GUEST000P01&token=eyJhbGciOiJIUzI1NiJ9.eyJvcmRlcklkIjoiS1pUTTI2REY5UTIzMDgxM0dVRVNUMDAwUDAxIiwicG9zSWQiOiJ0Y1JLYjZDQiIsImF1dGhvcml0aWVzIjpbIlJPTEVfQ0xJRU5UIl0sImV4cCI6MTY5MjAxMjE2MSwiaXNzIjoiUEFZVSIsImF1ZCI6ImFwaS1nYXRld2F5Iiwic3ViIjoiUGF5VSBzdWJqZWN0IiwianRpIjoiNDQyMTI2NjYtMDhhNS00MjY0LWI5MzgtYzgyMTMwYTkwODQ4In0.kNdQRNAYSwRjQou7lHsHXSL-pW-RN8k36LZbGdf3v0E\",\"orderId\":\"KZTM26DF9Q230813GUEST000P01\"}"
    end

    before(:each) do
      get_response = double
      allow(Net::HTTP).to receive(:get_response).and_return(get_response)
      allow(get_response).to receive(:body).and_return(get_response_body)
      post_response = double
      allow(Net::HTTP).to receive(:post).and_return(post_response)
      allow(post_response).to receive(:body).and_return(post_response_body)
    end

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
          path: "wyroznij-ogloszenie/#{listing_id}",
          title: "Wyróżnij ogłoszenie",
        },
        'current/en': {
          path: "promote-listing/#{listing_id}",
          title: "Promote the Listing",
        },
      )
    end
    let(:visitor_control) { {} }
    let(:visitor_data) do
      {
        orderHref: 'https://merch-prod.snd.payu.com/pay/?orderId=KZTM26DF9Q230813GUEST000P01&token=eyJhbGciOiJIUzI1NiJ9.eyJvcmRlcklkIjoiS1pUTTI2REY5UTIzMDgxM0dVRVNUMDAwUDAxIiwicG9zSWQiOiJ0Y1JLYjZDQiIsImF1dGhvcml0aWVzIjpbIlJPTEVfQ0xJRU5UIl0sImV4cCI6MTY5MjAxMjE2MSwiaXNzIjoiUEFZVSIsImF1ZCI6ImFwaS1nYXRld2F5Iiwic3ViIjoiUGF5VSBzdWJqZWN0IiwianRpIjoiNDQyMTI2NjYtMDhhNS00MjY0LWI5MzgtYzgyMTMwYTkwODQ4In0.kNdQRNAYSwRjQou7lHsHXSL-pW-RN8k36LZbGdf3v0E'
      }
    end
    let(:visitor_inputs) { {} }
    let(:schemaOrg) do
      {
        inLanguage: 'pl',
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        url: "http://local.mapawynajmu.pl:8080/wyroznij-ogloszenie/#{listing_id}",
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
        url: "http://local.mapawynajmu.pl:8080/wyroznij-ogloszenie/#{listing_id}",
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
        canonicalUrl: "http://local.mapawynajmu.pl:8080/wyroznij-ogloszenie/#{listing_id}",
        alternateLinks: "<link rel=\"alternate\" hreflang=\"pl\" href=\"http://local.mapawynajmu.pl:8080/wyroznij-ogloszenie/#{listing_id}\" /><link rel=\"alternate\" hreflang=\"en\" href=\"http://local.mapawynajmu.pl:8080/promote-listing/#{listing_id}\" />",
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
