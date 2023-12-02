# frozen_string_literal: true

require 'skillfind_tech/rails_helper'
require_relative './shared_contexts/sync.rb'

# TODO!
RSpec.describe ::SkillfindTech::Api::Sync do
  describe 'questionsShow' do
    include_context 'skillfind_tech_sync'

    let!(:question) {create(:question)}
    let(:route) { 'questions/test' }
    let(:visitor_app_data) do
      {
        lang: 'en'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        renderQuestions: true,
        renderQuestionsShow: true,
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
        :signOutButtonLabel=>"Sign Out",
        :showMyAccountMenuButtonLabel=>"My account",
        :allRightsReserved=>""
      }
    end
    let(:visitor_assets) do
      {
        svgs: {}
      }
    end
    let(:visitor_control) do
      {}
    end
    let(:visitor_data) do
      {
        type: 'multipleChoice',
        isSingleChoice: false,
        isMultipleChoice: true,
        title: 'test_title',
        body: 'test_body',
        answers: [],
        hint: 'test_hint',
        explanation: 'test_explanation',
        isSubmitted: false,
        isAnsweredCorrectly: nil,
        isAnyAnswerSelected: false
      }
    end
    let(:visitor_inputs) do
      {}
    end
    let(:schemaOrg) do
      {
        '@context': 'https://schema.org',
        '@graph': [
          {
            '@type': 'Organization',
            url: 'http://local.skillfind.tech:8080',
            name: 'skillfind.tech',
            sameAs: [
              'https://www.facebook.com/profile.php?id=100091302428884',
              'https://www.linkedin.com/company/skillfind-tech/',
            ]
          },
          {
            '@context': 'https://schema.org',
            '@type': 'WebSite',
            url: 'http://local.skillfind.tech:8080/questions/test',
            inLanguage: 'en',
            name: 'TODO',
            description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
            keywords: 'TODO',
            image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
            isFamilyFriendly: true
          },
        ],
      }
    end
    let(:openGraph) do
      {
        title: 'TODO',
        keywords: 'TODO',
        description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        siteName: 'skillfind.tech',
        url: 'http://local.skillfind.tech:8080/questions/test',
        type: 'website',
        locale: 'en_GB',
        'image:width': 1200,
        'image:height': 630,
        locales: [
          'en_GB',
          'pl_PL',
        ],
      }
    end
    let(:visitor_links) do
      common_links.merge(
        'current/en': {
          href: '/TODO',
        },
        'current/pl': {
          href: '/TODO',
        },
      )
    end
    let(:meta) do
      {
        lang: 'en',
        title: 'TODO',
        keywords: 'TODO',
        description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        langs: [
          'en',
          'pl'
        ],
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.skillfind.tech:8080/questions/test',
        alternateLangLinks: [
          {
            href: 'http://local.skillfind.tech:8080/TODO',
            hrefLang: 'en',
          },
          {
            href: 'http://local.skillfind.tech:8080/TODO',
            hrefLang: 'pl',
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
