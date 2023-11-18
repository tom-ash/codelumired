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
          }
        ]
      ])
    end
  end
end
