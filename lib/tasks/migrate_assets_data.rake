# frozen_string_literal: true

require 'open-uri'

task migrate_assets_data: :environment do
  ASSETS_URI = ENV['WARSAWLEASEPL_ASSETS']

  Asset.destroy_all

  assets = JSON.load(URI.open(ASSETS_URI))

  assets.each do |name, attrs|
    Asset.create(
      name: name,
      type: attrs['type'],
      data: attrs['data']
    )
  end
end

# For local testing
# assets_file = File.open "../../assets_20210227.json"
# assets = JSON.load(assets_file)