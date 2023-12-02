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

  task upload_categories: :environment do
    categories = JSON.parse(File.read('./sites/skillfind_tech/fixtures/categories.json'))

    categories.map do |category|
      ::SkillfindTech::Category.upsert({
        id: category['id'],
        name: category['name'],
        pl: category['pl'],
        en: category['en'],
      }, unique_by: :id)
    end
  end

  task upload_questions: :environment do
    questions = JSON.parse(File.read('./sites/skillfind_tech/fixtures/questions.json'))

    questions.map do |question|
      answers = question['answers']

      category_id = ::SkillfindTech::Category.find_by!(name: question['category']).id

      ::SkillfindTech::Question.upsert({
        id: question['id'],
        category_id: category_id,
        question_type: question['type'],
        lang: 'en',
        title: question['title'],
        url: question['title'].parameterize,
        body: question['body'],
        hint: question['hint'],
        explanation: question['explanation'],
      }, unique_by: :id)

      answers.map do |answer|
        ::SkillfindTech::QuestionAnswer.upsert({
          id: answer['id'],
          question_id: question['id'],
          sequence_letter: answer['sequenceLetter'],
          body: answer['body'],
          is_correct: answer['isCorrect']
        })
      end
    end
  end
end
