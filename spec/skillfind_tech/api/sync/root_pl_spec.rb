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
        postings: true,
        'postings/index': true,
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
    let(:visitor_links) do
      common_links.merge(
        'current/en': {
          href: '/',
          title: 'IT Skill Board | skillfind.tech',
          label: nil,
          hrefLang: 'en',
          icon: nil,
        },
        'current/pl': {
          href: '/pl',
          title: 'Tablica umiejętności IT | skillfind.tech',
          label: nil,
          hrefLang: 'pl',
          icon: nil,
        },
        facebook: {
          external: true,
          href: 'https://www.facebook.com/profile.php?id=100091302428884',
        },
        linkedin: {
          external: true,
          href: 'https://www.linkedin.com/company/skillfind-tech/'
        },
      )
    end
    let(:visitor_texts) do
      {
        skillSelectPlaceholder: 'Search skills',
        b2bContract: 'B2B',
        b2bPer: 'h',
        employmentContract: 'Emp.',
        employmentPer: 'm',
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
      {
        isPinsDrawn: false,
        mapOptions: {
          center: {
            lat: 38,
            lng: 12
          },
          zoom: 2
        },
      }
    end
    let(:visitor_data) do
      {
        postings: [],
        pages: [],
        articles: [],
      }
    end
    let(:visitor_inputs) do
      {
        selectableSkills: [],
        selectedSkills: [],
      }
    end
    let(:schemaOrg) do
      {
        '@context': 'https://schema.org',
        '@graph': [
          schemaOrgOrganization,
          {
            '@context': 'https://schema.org',
            '@type': 'WebSite',
            url: 'http://local.skillfind.tech:8080',
            inLanguage: 'en',
            name: 'IT Skill Board | skillfind.tech',
            description: 'skillfind.tech is an IT skill board. Add & search skill driven job postings. Start for free.',
            keywords: 'skillfind.tech, skill, find, tech, it, skills, board, job, jobs, talent, talents, dev, development, technology, programming, coding',
            image: 'https://skillfind-tech.s3.eu-central-1.amazonaws.com/images/skillfind-tech.jpeg',
            isFamilyFriendly: true,
          },
        ],
      }
    end
    let(:openGraph) do
      {
        title: 'IT Skill Board | skillfind.tech',
        keywords: 'skillfind.tech, skill, find, tech, it, skills, board, job, jobs, talent, talents, dev, development, technology, programming, coding',
        description: 'skillfind.tech is an IT skill board. Add & search skill driven job postings. Start for free.',
        image: 'https://skillfind-tech.s3.eu-central-1.amazonaws.com/images/skillfind-tech.jpeg',
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
        title: 'IT Skill Board | skillfind.tech',
        keywords: 'skillfind.tech, skill, find, tech, it, skills, board, job, jobs, talent, talents, dev, development, technology, programming, coding',
        description: 'skillfind.tech is an IT skill board. Add & search skill driven job postings. Start for free.',
        image: 'https://skillfind-tech.s3.eu-central-1.amazonaws.com/images/skillfind-tech.jpeg',
        langs: ['en', 'pl'],
        robots: 'index,follow,all',
        canonicalUrl: 'http://local.skillfind.tech:8080',
        schemaOrg: schemaOrg,
        openGraph: openGraph,
        alternateLinks: [
          {
            href: 'http://local.skillfind.tech:8080/',
            hrefLang: 'en',
          },
          {
            href: 'http://local.skillfind.tech:8080/pl',
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
        let!(:javascript_selected_skill) {
          create(
            :javascript_selected_skill,
            posting: posting,
            skill: javascript_skill,
          )
        }

        it 'includes postings in data in state' do
          subject
          expect(body[:state][:data][:postings]).to match([
            {
              id: posting.id,
              createdAt: an_instance_of(String),
              href: "/#{posting.id}--expert",
              activeUntil: nil,
              logo: 'https://skillfind-tech-dev.s3.eu-central-1.amazonaws.com/logos/',
              businessName: nil,
              position: 'test',
              industry: 'Software House',
              industryIcon: 'laptopWithCode',
              b2b: true,
              b2bCurrency: nil,
              b2bMax: 0,
              b2bMin: 0,
              employment: true,
              employmentCurrency: nil,
              employmentMax: 0,
              employmentMin: 0,
              cooperationMode: {
                icon: 'earthGlobe',
                label: 'Remote',
                symbol: 'earthGlobe',
                value: 'remote'
              },
              country: 'Poland',
              lat: 52.0,
              lng: 12.0,
              locality: 'Warsaw',
              sublocality: nil,
              skills: [
                {
                  display: nil,
                  level: 4,
                  value: 'JavaScript'
                },
              ],
            }
          ])
        end
      end
    end
  end
end
