# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::MapawynajmuPl::Api::Sync do
  describe 'page/show' do
    include_context 'mapawynajmu_pl_sync'

    let!(:user) { create(:mapawynajmu_pl_user, first_name: 'John', last_name: 'Doe', author_data: {
      url: 'https://www.example.net',
      jobTitle: 'Copywriter',
      pictureUrl: 'https://www.example.net/author.jpeg',
      honorificPrefix: 'Mr',
    })}
    let(:grandparent_page) { create(:mapawynajmu_pl_page, user: user, url: 'articles' ) }
    let(:parent_page) { create(:mapawynajmu_pl_page, user: user, url: 'articles-about-apartments', parent_id: grandparent_page.id) }
    let(:page) { create(:mapawynajmu_pl_page, user: user, parent_id: parent_page.id) }
    let(:route) { page.url }
    let(:visitor_app_data) do
      {
        lang: 'pl'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        page: true,
        'page/show': true,
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
          href: 'http://local.mapawynajmu.pl:8080/test-page-url',
          path: 'test-page-url',
          title: nil
        },
        'current/en': {
          path: nil
        },
        'page/edit': {
          path: 'strony/test-page-url'
        }
      )
    end
    let(:visitor_control) { {} }
    let(:visitor_data) do
      {
        id: page.id,
        url: 'test-page-url',
        lang: 'pl',
        body: [],
        pages: [],
        canonicalUrl: nil,
        title: nil,
        description: nil,
        keywords: nil,
        coverImage: nil,
        online: nil,
        headerAutonumbering: nil,
        schemaMode: 'auto',
        autoSchema: {},
        manualSchema: {},
        publishedOn: nil,
        modifiedOn: nil,
        category: nil,
        subcategory: nil,
        langAltsGroup: nil,
        pageLang: 'pl',
        langVerUrls: {
          pl: 'test-page-url'
        },
        schemaOrg: {},
        author: {
          firstName: 'John',
          lastName: 'Doe',
          url: 'https://www.example.net',
          pictureUrl: 'https://www.example.net/author.jpeg',
        },
        breadcrumbs: [
          {
            item: 'https://mapawynajmu.pl',
            name: 'Strona główna',
          },
          {
            item: 'http://local.mapawynajmu.pl:8080/articles-about-apartments',
            name: nil,
          },
          {
            item: 'http://local.mapawynajmu.pl:8080/articles',
            name: nil,
          }
        ]
      }
    end
    let(:visitor_inputs) { {} }
    let(:schemaOrg) do
      {
        '@context': "https://schema.org",
        '@graph': [
          {
            '@type': 'Article',
            inLanguage: 'pl',
            name: nil,
            description: nil,
            keywords: nil,
            datePublished: nil,
            dateModified: nil,
            url: 'http://local.mapawynajmu.pl:8080/test-page-url',
            isFamilyFriendly: true,
            image: nil,
            author: {
              '@type': 'Person',
              name: 'John Doe',
              url: 'https://www.example.net',
              jobTitle: 'Copywriter',
              honorificPrefix: 'Mr',
            }
          },
          {
            '@type': 'BreadcrumbList',
            itemListElement: [
              {
                '@type': 'ListItem',
                position: 1,
                name: 'Strona główna',
                item: 'https://mapawynajmu.pl'
              },
              {
                '@type': 'ListItem',
                position: 2,
                name: nil,
                item: 'http://local.mapawynajmu.pl:8080/articles-about-apartments',
              },
              {
                '@type': 'ListItem',
                position: 3,
                name: nil,
                item: 'http://local.mapawynajmu.pl:8080/articles',m 
              },
            ]
          },
        ]
      }
    end
    let(:openGraph) do
      {
        locale: 'pl_PL',
        locales: ['pl_PL', 'en_GB'], # Is this correct?
        url: 'http://local.mapawynajmu.pl:8080/test-page-url',
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
        canonicalUrl: 'http://local.mapawynajmu.pl:8080/test-page-url',
        alternateLinks: "<link rel=\"alternate\" hreflang=\"pl\" href=\"http://local.mapawynajmu.pl:8080/test-page-url\" /><link rel=\"alternate\" hreflang=\"en\" href=\"http://local.mapawynajmu.pl:8080/\" />", # TODO!: Fix!
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        author: "John Doe",
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
