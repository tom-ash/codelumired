# frozen_string_literal: true

namespace :skillfind_tech do
  desc 'SkillfindTech Grape Routes'
  task routes: :environment do
    ::SkillfindTech::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end

  desc 'Update Page Schemas'
  task update_page_schemas: :environment do
    ::SkillfindTech::Page.all.each do |page|
      ::Builders::Pages::SchemaOrgBuilder.new(
        page: page,
        domain_url: SKILLFIND_TECH_URL,
        bucket: SKILLFIND_TECH_S3
      ).call
    end
  end

  desc 'Transform Page Bodies'
  task transform_page_bodies: :environment do
    ::SkillfindTech::Page.all.each do |page|
      ::Commands::Page::TransformBody.new(
        page: page,
        constantized_site_name: 'SkillfindTech',
        bucket: ENV['AWS_S3_SkillfindTech_BUCKET']
      ).call
    end
  end
end
