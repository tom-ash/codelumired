# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      module Posting
        module Create
          class AsUser < Grape::API
            before { authorize! }

            params do
              requires :selected_skills, type: Array
              # requires :remote, type: Boolean
              # requires :hybrid, type: Boolean
              # requires :office, type: Boolean
              requires :b2b, type: Boolean
              optional :b2b_min, type: Integer
              optional :b2b_max, type: Integer
              # requires :employment, type: Boolean
              # optional :employment_min, type: Integer
              # optional :employment_min, type: Integer
              # requires :civil_contract, type: Boolean
            end
            post do
              ::SkillfindTech::Commands::Posting::Create.new(
                user_id: authenticated_user.id,
                attrs: {
                  selected_skills: params[:selected_skills],
                  # remote: params[:remote],
                  # hybrid: params[:hybrid],
                  # office: params[:office],
                  b2b: params[:b2b],
                  b2b_min: params[:b2b_min],
                  b2b_max: params[:b2b_max],
                  # employment: params[:employment],
                  # civil_contract: params[:civil_contract],
                },
              ).call

              ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
            end
          end
        end
      end
    end
  end
end
