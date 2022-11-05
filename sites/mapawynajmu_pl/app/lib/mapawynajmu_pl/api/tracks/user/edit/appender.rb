# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta

            private

            def merge_state
              state.merge!(
                'user/edit/data': ::Serializers::User::Edit.new(
                  user: current_user,
                  constantized_site_name: constantized_site_name,
                ).call,
                'user/edit/inputs': {
                  country_code: current_user.country_code,
                },
              )
            end
          end
        end
      end
    end
  end
end
