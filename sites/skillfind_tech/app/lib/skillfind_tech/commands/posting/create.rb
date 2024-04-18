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
            cooperation_mode: attrs[:cooperation_mode],
            pl_description: attrs[:pl_description],
            en_description: attrs[:en_description],
            company_size: 42,
            b2b: attrs[:b2b],
            b2b_min: attrs[:b2b_min],
            b2b_max: attrs[:b2b_max],
            employment: attrs[:employment],
            employment_min: attrs[:employment_min],
            employment_max: attrs[:employment_max],
            lat: attrs[:lat],
            lng: attrs[:lng],
            place_id: attrs[:place_id],
            place_autocomplete: attrs[:place_autocomplete],
            country: attrs[:country],
            locality: attrs[:locality],
            sublocality: attrs[:sublocality],
          )
        end

        def add_skills_to_job
          selected_skills.each do |selected_skill|
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
