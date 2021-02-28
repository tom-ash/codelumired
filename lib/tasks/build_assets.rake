# frozen_string_literal: true

require 'open-uri'
require 'optparse'

task build_assets: :environment do
  ASSETS_URI = ENV['WARSAWLEASEPL_ASSETS']

  ARGV.each { |a| task a.to_sym }

  site = ARGV[1].capitalize

  return unless site.present?

  Object.const_get(site)::Asset.destroy_all

  assets = JSON.load(URI.open(ASSETS_URI))

  assets.each do |name, attrs|
    Object.const_get(site)::Asset.create( name: name, type: "#{site}::#{attrs['type']}", data: attrs['data'])
  end
end
