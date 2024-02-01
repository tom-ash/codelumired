# frozen_string_literal =>true

require 'skillfind_tech/rails_helper'

RSpec.describe ::SkillfindTech::Api::Tracks::Root::Sitemap do
  let(:get_sitemap) do
    get '/skillfind-tech/sitemap'
  end
  let(:body) do
    JSON.parse(response.body).map do |link_group|
      link_group.map(&:deep_symbolize_keys)
    end
  end
  let!(:question) { create(:question) }

  describe '/sitemap' do
    it 'responds with :ok (201) status' do
      get_sitemap
      expect(response.status).to eq(200)
    end

    it 'responds with sitemap data' do
      get_sitemap
      expect(body).to eq([
        [
          {
            href: '/',
            hrefLang: 'en',
            priority: '1.0',
            changeFreq: 'daily',
          },
          {
            href: '/pl',
            hrefLang: 'pl',
            priority: '1.0',
            changeFreq: 'daily',
          },
        ],
        [
          {
            href: '/contact',
            hrefLang: 'en',
            priority: '0.8',
            changeFreq: 'monthly',
          },
          {
            href: '/kontakt',
            hrefLang: 'pl',
            priority: '0.8',
            changeFreq: 'monthly',
          },
        ],
        [
          {
            href: '/terms-of-service',
            hrefLang: 'en',
            priority: '0.5',
            changeFreq: 'monthly',
          },
          {
            href: '/regulamin',
            hrefLang: 'pl',
            priority: '0.5',
            changeFreq: 'monthly',
          },
        ],
        [
          {
            href: '/cookies-policy',
            hrefLang: 'en',
            priority: '0.5',
            changeFreq: 'monthly',
          },
          {
            href: '/polityka-cookies',
            hrefLang: 'pl',
            priority: '0.5',
            changeFreq: 'monthly',
          },
        ],
        [
          {
            href: '/privacy-policy',
            hrefLang: 'en',
            priority: '0.5',
            changeFreq: 'monthly',
          },
          {
            href: '/polityka-prywatnosci',
            hrefLang: 'pl',
            priority: '0.5',
            changeFreq: 'monthly',
          },
        ],
        [
          {
            href: '/privacy-settings',
            hrefLang: 'en',
            priority: '0.5',
            changeFreq: 'monthly',
          },
          {
            href: '/ustawienia-prywatnosci',
            hrefLang: 'pl',
            priority: '0.5',
            changeFreq: 'monthly',
          },
        ],
        [
          {
            href: '/javascript/practice-problems/test',
            hrefLang: 'en',
            priority: '1.0',
            changeFreq: 'monthly',
          }
        ],
      ])
    end
  end
end
