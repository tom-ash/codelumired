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
end
