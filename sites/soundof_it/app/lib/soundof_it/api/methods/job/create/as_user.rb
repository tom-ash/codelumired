# frozen_string_literal: true

module SoundofIt
  module Api
    module Methods
      module Job
        module Create
          class AsUser < Grape::API
            # before { authorize! }

            params do
              requires :selected_skills, type: Array
            end
            post do
              ::SoundofIt::Commands::Job::Create.new(
                user_id: nil,
                attrs: {
                  selected_skills: params[:selected_skills]
                }
              ).call
            end
          end
        end
      end
    end
  end
end
