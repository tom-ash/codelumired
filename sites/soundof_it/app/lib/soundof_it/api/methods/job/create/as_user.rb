# frozen_string_literal: true

module SoundofIt
  module Api
    module Methods
      module Job
        module Create
          class AsUser < Grape::API
            before { authorize! }

            params do
              requires :selected_skills, type: Array
              requires :remote, type: Boolean
              requires :hybrid, type: Boolean
              requires :office, type: Boolean
            end
            post do
              ::SoundofIt::Commands::Job::Create.new(
                user_id: current_user.id,
                attrs: {
                  selected_skills: params[:selected_skills],
                  remote: params[:remote],
                  hybrid: params[:hybrid],
                  office: params[:office]
                }
              ).call
            end
          end
        end
      end
    end
  end
end
