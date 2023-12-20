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
        path_en: category['pathEn'],
        path_pl: category['pathPl'],
        en: category['en'],
        pl: category['pl'],
      }, unique_by: :id)
    end
  end

  task build_questions: :environment do
    practice_problems = []
    practice_problem_jsons = Dir["../practice-problems/**/*.json"]

    practice_problem_jsons.map do |json_file|
      practice_problem = JSON.parse(File.read(json_file))

      practice_problems << practice_problem
    end

    ::Commands::S3Object::Upload.new(
      bucket: 'soundofit-dev',
      key: 'practice-problems.json',
      body: practice_problems.to_json,
    ).call
  end

  task upload_questions: :environment do
    s3_client = Aws::S3::Client.new(region: Rails.application.secrets.aws_region)

    questionsAsJson = s3_client.get_object(
      bucket: 'soundofit-dev',
      key: 'practice-problems.json',
    ).body.read

    questions = JSON.parse(questionsAsJson)

    questions.map do |question|
      answers = question['answers']

      category_id = ::SkillfindTech::Category.find_by!(name: question['category']).id

      ::SkillfindTech::Question.upsert({
        id: question['id'],
        category_id: category_id,
        question_type: question['type'],
        difficulty: question['difficulty'],
        assesses: question['assesses'],
        lang: 'en',
        title: question['title'],
        description: question['description'],
        url: question['title'].parameterize,
        body: question['body'],
        hint: question['hint'],
      }, unique_by: :id)

      answers.each_with_index.map do |answer, index|
        ::SkillfindTech::QuestionAnswer.upsert({
          id: answer['id'],
          position: index,
          question_id: question['id'],
          body: answer['body'],
          is_correct: answer['isCorrect'],
          explanation: answer['explanation'],
          hint: answer['hint'],
        })
      end
    end
  end
end
