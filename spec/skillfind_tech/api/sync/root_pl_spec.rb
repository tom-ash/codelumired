# frozen_string_literal: true

require 'skillfind_tech/rails_helper'
require_relative './shared_contexts/sync.rb'

RSpec.describe ::SkillfindTech::Api::Sync do
  describe 'root' do
    include_context 'skillfind_tech_sync'

    let(:route) { '/' }
    let(:visitor_app_data) do
      {
        lang: 'en'
      }
    end
    let(:visitor_render) do
      {
        visitor: true,
        renderPostingIndex: true,
        renderVisitorPageIndex: true,
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
        honeYourSkillsHeadingTwo: 'Hone your tech skills',
        signOutButtonLabel: 'Sign Out',
        showMyAccountMenuButtonLabel: 'My account',
        allRightsReserved: '',
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
        postings: [],
        pages: [],
        articles: [],
      }
    end
    let(:visitor_inputs) do
      {}
    end
    let(:schemaOrg) do
      {
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        url: 'http://local.skillfind.tech:8080',
        inLanguage: 'en',
        name: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
        keywords: 'skillfind.tech, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet',
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        isFamilyFriendly: true,
      }
    end
    let(:openGraph) do
      {
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        keywords: 'skillfind.tech, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet',
        description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        siteName: 'skillfind.tech',
        url: 'http://local.skillfind.tech:8080',
        type: 'website',
        locale: 'en_GB',
        'image:width': 1200,
        'image:height': 630,
        locales: [
          'en_GB', # TODO?: Change to US?
          'pl_PL',
        ]
      }
    end
    let(:meta) do
      {
        lang: 'en',
        title: 'skillfind.tech | IT Skill Driven Posting Board & Knowledge Repository',
        keywords: 'skillfind.tech, job, board, IT, dev, programming, coding, code, knowledge, repository, cheat sheet',
        description: 'skillfind.tech is an IT skill driven job board and a knowledge repository. Add and search jobs and learn with us.',
        image: 'https://soundofit.s3.eu-central-1.amazonaws.com/soundof.it.jpeg',
        langs: ['en', 'pl'],
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.skillfind.tech:8080',
        alternateLinks: '<link rel="alternate" hreflang="en" href="http://local.skillfind.tech:8080//" /><link rel="alternate" hreflang="pl" href="http://local.skillfind.tech:8080/pl" />',
        # TODO!: ERROR! (//)
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

    describe 'postings' do
      context 'when no postings exist' do
        it 'includes empty array in :postings' do
          subject
          expect(body[:state][:data][:postings]).to eq([])
        end
      end

      context 'when postings exist' do
        let(:posting) { create(:skillfind_tech_posting, user: user) }
        let(:javascript_skill) { create(:javascript_skill) }
        let!(:javascript_selected_skill) { create(:javascript_selected_skill, posting: posting, skill: javascript_skill) }

        it 'includes postings in data in state' do
          subject
          expect(body[:state][:data][:postings]).to eq([
            {
              :b2b=>true,
              :b2bMax=>0,
              :b2bMin=>0,
              :id=>posting.id,
              :skills=> [
                {
                  id: nil,
                  name: 'JavaScript',
                  level: 5,
                }
              ]
            }
          ])
        end
      end
    end
  end
end
