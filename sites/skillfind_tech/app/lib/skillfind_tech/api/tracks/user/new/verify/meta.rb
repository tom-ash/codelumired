# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Verify
            module Meta
              include ::Helpers::MetaLocalizations

              TRACK = 'user/new/Verify'

              UNLOCALIZED_PATH = {
                en: %r{^posters/verify/(?<id>.+)$},
                pl: %r{^pl/ogloszeniodawcy/zweryfikuj/(?<id>.+)$},
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'Verify',
                pl: 'Zweryfikuj',
              }.freeze

              private

              def id
                @id ||= match_data[:id]
              end

              def match_data
                @match_data ||= unlocalized_path[lang].match(url)
              end

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def metaLozalizationPath
                @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/verify/localizations/meta/#{lang}.json"
              end

              def render
                {
                  'visitor': true,
                  'user': true,
                  'user/new': true,
                  'user/new/verify': true,
                }
              end

              def links
                {
                  'current/pl': ::SkillfindTech::Api::Tracks::User::New::Verify::Linker.new(:pl, id: id).call,
                  'current/en': ::SkillfindTech::Api::Tracks::User::New::Verify::Linker.new(:en, id: id).call,
                }
              end

              def asset_names
                @asset_names ||= %i[chevron camera close rotate]
              end
            end
          end
        end
      end
    end
  end
end
