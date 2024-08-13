# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Index
            module Meta
              include ::Helpers::MetaLocalizations

              TRACK = 'user/postings/index'

              UNLOCALIZED_PATH = {
                en: 'added-postings',
                pl: 'pl/dodane-ogloszenia',
              }.freeze

              private

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def metaLozalizationPath
                @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/postings/index/localizations/meta/#{lang}.json"
              end

              def render
                {
                  "#{TRACK}": true
                }
              end

              def links
                {
                  'current/en': ::SkillfindTech::Api::Tracks::User::Postings::Index::Linker.new(:en).call,
                  'current/pl': ::SkillfindTech::Api::Tracks::User::Postings::Index::Linker.new(:pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
