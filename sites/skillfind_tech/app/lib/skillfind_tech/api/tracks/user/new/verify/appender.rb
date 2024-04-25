# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Verify
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::User::New::Verify::State
              include ::SkillfindTech::Api::Tracks::User::New::Verify::Meta

              private
              
              def localizations
                @localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/Verify/localizations/#{lang}.json")
              end
            end
          end
        end
      end
    end
  end
end
