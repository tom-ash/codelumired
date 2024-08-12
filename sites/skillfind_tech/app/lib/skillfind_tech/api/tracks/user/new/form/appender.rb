# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::User::New::Form::State
              include ::SkillfindTech::Api::Tracks::User::New::Form::Meta
              include ::SkillfindTech::Api::Tracks::Posting::Common::Industries

              private
              
              def localizations
                @localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/form/localizations/#{lang}.json")
              end

              def asset_names
                @asset_names ||= header_asset_names + industryIcons + ['plus', 'rotate', 'close', 'dot', 'emptyDot']
              end
            end
          end
        end
      end
    end
  end
end
