# frozen_string_literal: true

module SkillfindTech
  module Commands
    module Posting
      class Create
        def initialize(user_id:, attrs:)
          @user_id = user_id
          @attrs = attrs
        end

        def call
          ActiveRecord::Base.transaction do
            posting.save!
            add_skills_to_job
          end

          posting
        end

        private

        attr_reader :user_id, :attrs

        def posting
          @posting ||= ::SkillfindTech::Posting.new(
            user: user,
            views: 0,
            company_name: 'Not implemented!',
            company_size: 42,
            country: 'Not implemented!',
            locality: 'Not implemented!',
            remote: false,
            hybrid: false,
            office: false,
            b2b: attrs[:b2b],
            b2b_min: attrs[:b2b_min],
            b2b_max: attrs[:b2b_max],
            employment: false,
            # employment_min: attrs[:employment_min],
            # employment_max: attrs[:employment_max],
            # # civil_contract: attrs[:civil_contract], # TODO
          )
        end

        def add_skills_to_job
          selected_skills.each do |selected_skill|
            # byebug
            @posting.selected_skills.create!(
              skill: ::SkillfindTech::Skill.find_by(name: selected_skill[:name]),
              level: selected_skill[:level],
            )
          end
        end

        def selected_skills
          @selected_skills ||= attrs[:selected_skills]
        end

        def user
          ::SkillfindTech::User.find(user_id)
        end
      end
    end
  end
end
