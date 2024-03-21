# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Postings < Grape::API
        before { authorize! }

        params do
          requires :business_name, type: String
          requires :industry, type: String
          requires :selected_skills, type: Array
          requires :cooperation_mode, type: String
          requires :b2b, type: Boolean
          optional :b2b_min, type: Integer
          optional :b2b_max, type: Integer
          # requires :employment, type: Boolean
          # optional :employment_min, type: Integer
          # optional :employment_max, type: Integer
          # requires :civil_contract, type: Boolean
          # optional :civil_contract_min, type: Integer
          # optional :civil_contract_max, type: Integer
          requires :lat, type: Float
          requires :lng, type: Float
          requires :place_id, type: String
          requires :place_autocomplete, type: String
          optional :country, type: String
          optional :locality, type: String
          optional :sublocality, type: String
        end
        post do
          ::SkillfindTech::Commands::Posting::Create.new(
            user_id: authenticated_user.id,
            attrs: {
              business_name: params[:business_name],
              industry: params[:industry],
              selected_skills: params[:selected_skills],
              cooperation_mode: params[:cooperation_mode],
              b2b: params[:b2b],
              b2b_min: params[:b2b_min],
              b2b_max: params[:b2b_max],
              # employment: params[:employment],
              # civil_contract: params[:civil_contract],
              lat: params[:lat],
              lng: params[:lng],
              place_id: params[:place_id],
              place_autocomplete: params[:place_autocomplete],
              country: params[:country],
              locality: params[:locality],
              sublocality: params[:sublocality],
            },
          ).call

          ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
        end
      end
    end
  end
end
  