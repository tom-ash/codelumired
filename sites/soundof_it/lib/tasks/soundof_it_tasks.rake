# frozen_string_literal: true

namespace :soundof_it do
  desc 'SoundofIt Grape Routes'
  task routes: :environment do
    ::SoundofIt::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end

  desc 'Update Page Schemas'
  task update_page_schemas: :environment do
    ::SoundofIt::Page.all.each do |page|
      ::Builders::Pages::SchemaOrgBuilder.new(
        page: page,
        domain_url: SOUNDOF_IT_URL,
        bucket: SOUNDOF_IT_S3
      ).call
    end
  end

  desc 'Transform Page Bodies'
  task transform_page_bodies: :environment do
    ::SoundofIt::Page.all.each do |page|
      ::Commands::Page::TransformBody.new(
        page: page,
        constantized_site_name: 'SoundofIt',
        bucket: ENV['AWS_S3_SOUNDOFIT_BUCKET']
      ).call
    end
  end
end
