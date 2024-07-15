# frozen_string_literal: true

module SkillfindTech
  module Commands
    module Posting
      class Update
        def initialize(user_id:, attrs:)
          @user_id = user_id
          @attrs = attrs
        end

        def call
          ActiveRecord::Base.transaction do
            update_posting
            remove_current_skills
            add_new_skills
          end

          posting
        end

        private

        attr_reader :user_id, :attrs

        def update_posting
          posting.update(
            cooperation_mode: attrs[:cooperation_mode],
            position: attrs[:position],
            pl_description: attrs[:pl_description],
            en_description: attrs[:en_description],
            company_size: 42, # TODO: REMOVE
            b2b: attrs[:b2b],
            b2b_min: attrs[:b2b_min],
            b2b_max: attrs[:b2b_max],
            b2b_currency: attrs[:b2b_currency],
            employment: attrs[:employment],
            employment_min: attrs[:employment_min],
            employment_max: attrs[:employment_max],
            employment_currency: attrs[:employment_currency],
            lat: attrs[:lat],
            lng: attrs[:lng],
            place_id: attrs[:place_id],
            place_autocomplete: attrs[:place_autocomplete],
            country: attrs[:country],
            locality: attrs[:locality],
            sublocality: attrs[:sublocality],
            form_application_manner: attrs[:form_application_manner],
            link_application_manner: attrs[:link_application_manner],
            application_link: attrs[:application_link],
          )
        end

        def remove_current_skills
          posting.selected_skills.destroy_all
        end

        def add_new_skills
          selected_skills.each do |selected_skill|
            @posting.selected_skills.create!(
              skill: ::SkillfindTech::Skill.find_by(name: selected_skill[:name]),
              level: selected_skill[:level],
            )
          end
        end

        def posting
          @posting ||= ::SkillfindTech::Posting.find_by!(
            user_id: user_id,
            id: attrs[:posting_id],
          )
        end

        def selected_skills
          @selected_skills ||= attrs[:selected_skills]
        end
      end
    end
  end
end
