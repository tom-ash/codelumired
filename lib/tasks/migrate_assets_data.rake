# frozen_string_literal: true

task migrate_assets_data: :environment do
  Asset.all.each do |asset|
    data = { viewBox: '0 0 512 512', pathData: asset.path_data }
    asset.update!(type: 'SVG', data: data)
  end
end
