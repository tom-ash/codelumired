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
          ::SoundofIt::Job.create!(
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

          # TODO: ADD SKILLS
        end

        private

        attr_reader :user_id, :attrs

        def user
          ::SoundofIt::User.find(user_id)
        end
      end
    end
  end
end
