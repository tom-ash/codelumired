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
        ]
      ])
    end
  end
end
