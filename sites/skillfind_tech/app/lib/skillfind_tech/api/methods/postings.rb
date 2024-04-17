# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Postings < Grape::API
        before { authorize! }

        params do
          requires :selected_skills, type: Array # TODO: Validate min. 1 length. Object: [{"name"=>"TypeScript", "level"=>3}].
          requires :cooperation_mode, type: String
          requires :lat, type: Float
          requires :lng, type: Float
          requires :place_id, type: String
          requires :place_autocomplete, type: String
          optional :country, type: String
          optional :locality, type: String
          optional :sublocality, type: String
          requires :description, type: String
          requires :b2b, type: Boolean
          optional :b2b_min, type: Integer
          optional :b2b_max, type: Integer
          requires :employment, type: Boolean
          optional :employment_min, type: Integer
          optional :employment_max, type: Integer

        end
        post do
          ::SkillfindTech::Commands::Posting::Create.new(
            user_id: authenticated_user.id,
            attrs: {
              selected_skills: params[:selected_skills],
              cooperation_mode: params[:cooperation_mode],
              place_id: params[:place_id],
              lat: params[:lat],
              lng: params[:lng],
              place_autocomplete: params[:place_autocomplete],
              country: params[:country],
              locality: params[:locality],
              sublocality: params[:sublocality],
              description: params[:description],
              b2b: params[:b2b],
              b2b_min: params[:b2b_min],
              b2b_max: params[:b2b_max],
              employment: params[:employment],
              employment_min: params[:employment_min],
              employment_max: params[:employment_max],
            },
          ).call

          ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
        end
      end
    end
  end
end
  