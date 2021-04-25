# frozen_string_literal: true

require 'open-uri'
require 'optparse'

task build_assets: :environment do
  ASSETS_URI = ENV['WARSAWLEASEPL_ASSETS']

  ARGV.each { |a| task a.to_sym }

  site = ARGV[1].capitalize

  return unless site.present?

  Object.const_get(site)::Asset.destroy_all

  # Prod
  assets = JSON.load(URI.open(ASSETS_URI))

  # Local
  # assets_file = File.open '../../Assets/assets_20210425.json'
  # assets = JSON.load(assets_file)

  assets.each do |name, attrs|
    Object.const_get(site)::Asset.create( name: name, type: "#{site}::#{attrs['type']}", data: attrs['data'])
  end
end
