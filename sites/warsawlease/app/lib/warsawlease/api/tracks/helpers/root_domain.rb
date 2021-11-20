# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Helpers
        module RootDomain
          private

          def root_domain
            return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

            'https://www.warsawlease.pl'
          end
        end
      end
    end
  end
end
