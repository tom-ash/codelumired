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
        bucket: SKILLFIND_TECH_S3,
      ).call
    end
  end

  task build_skills: :environment do
    skills = JSON.parse(File.read('sites/skillfind_tech/fixtures/skills.json'))

    skills.each do |skill|
      time_now = Time.now
      existing_skill = ::SkillfindTech::Skill.find_by(name: skill['name'])&.attributes || {
        created_at: time_now,
        updated_at: time_now,
      }
      ::SkillfindTech::Skill.upsert(existing_skill.merge(skill), unique_by: :name)
    end
  end
end
