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
            remote: true,
            hybrid: true,
            office: true,
            country: 'Poland',
            locality: 'Warsaw',
            employment: true,
            b2b: true
            # employment_min
            # employment_max
            # b2b_min
            # b2b_max
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
