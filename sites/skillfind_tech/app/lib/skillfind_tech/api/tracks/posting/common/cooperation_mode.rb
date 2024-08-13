# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module CooperationMode
            private

            def localizedCooperationMode(cooperationMode)
              localizedCooperationModes.find do |mode|
                mode[:value] == cooperationMode
              end
            end

            def localizedCooperationModes
              @localizedCooperationModes ||= getLocalizations("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/common/localizations/cooperation-modes/#{lang}.json")[:cooperationModes]
            end
          end
        end
      end
    end
  end
end
