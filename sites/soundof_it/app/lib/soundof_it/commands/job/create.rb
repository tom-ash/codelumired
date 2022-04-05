# frozen_string_literal: true

module SoundofIt
  module Commands
    module Job
      class Create
        def initialize(user_id:, attrs:)
          @user_id = user_id
          @attrs = attrs
        end

        def call
          create_job
          add_skills_to_job
        end

        private

        attr_reader :user_id, :attrs

        def create_job
          @job ||= ::SoundofIt::Job.create!(
            user: user,
            views: 0,
            company_name: 'TODO',
            company_size: 'TODO',
            remote: attrs[:remote],
            hybrid: attrs[:hybrid],
            office: attrs[:office],
            b2b: attrs[:b2b],
            b2b_min: attrs[:b2b_min],
            b2b_max: attrs[:b2b_max],
            employment: attrs[:employment],
            employment_min: attrs[:employment_min],
            employment_max: attrs[:employment_max],
            # civil_contract: attrs[:civil_contract], # TODO
            country: 'Poland', # TODO
            locality: 'Warsaw' # TODO
          )
        end

        def add_skills_to_job
          selected_skills.each do |selected_skill|
            @job.coveted_skills.create!(
              skill: ::SoundofIt::Skill.find_by(name: selected_skill[:name]),
              level: selected_skill[:level]
            )
          end
        end

        def selected_skills
          @selected_skills ||= attrs[:selected_skills]
        end

        def user
          ::SoundofIt::User.find(user_id)
        end
      end
    end
  end
end
