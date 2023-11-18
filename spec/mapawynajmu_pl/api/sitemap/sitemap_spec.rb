# frozen_string_literal =>true

require 'mapawynajmu_pl/rails_helper.rb'

RSpec.describe ::Api::User::Create::EmailAndPassword do
  let(:get_sitemap) do
    get '/mapawynajmu-pl/sitemap'
  end
  let(:body) do
    JSON.parse(response.body).map do |link_group|
      link_group.map(&:deep_symbolize_keys)
    end
  end
  let(:user) { create(:mapawynajmu_pl_user) }
  let!(:office_listing) { create(:mapawynajmu_pl_listing, user: user, user_verified: true) }
  let!(:apartment_listing) { create(:mapawynajmu_pl_listing, category: 2, user: user, user_verified: true) }

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
            hrefLang: 'pl',
            priority: '1.0',
            changeFreq: 'daily',
          },
          {
            href: '/en',
            hrefLang: 'en',
            priority: '1.0',
            changeFreq: 'daily',
          },
        ],
        [
          {
            changeFreq: 'daily',
            href: '/dodaj-ogloszenie-wynajmu-nieruchomosci',
            hrefLang: 'pl',
            priority: '1.0',
          },
          {
            changeFreq: 'daily',
            href: '/add-real-estate-lease-listing',
            hrefLang: 'en',
            priority: '1.0',
          },
        ],
        [
          {
            changeFreq: 'weekly',
            href: "/#{office_listing.id}-biuro-na-wynajem",
            hrefLang: 'pl',
            priority: '0.9',
          },
          {
            changeFreq: 'weekly',
            href: "/#{office_listing.id}-office-for-lease",
            hrefLang: 'en',
            priority: '0.9',
          },
        ],
        [
          {
            changeFreq: 'weekly',
            href: "/#{apartment_listing.id}-mieszkanie-na-wynajem",
            hrefLang: 'pl',
            priority: '0.9',
          },
          {
            changeFreq: 'weekly',
            href: "/#{apartment_listing.id}-apartment-for-lease",
            hrefLang: 'en',
            priority: '0.9',
          },
        ],
        [
          {
            changeFreq: 'daily',
            href: '/zarejestruj',
            hrefLang: 'pl',
            priority: '0.5',
          },
          {
            changeFreq: 'daily',
            href: '/sign-up',
            hrefLang: 'en',
            priority: '0.5',
          },
        ],
      ])
    end
  end
end
