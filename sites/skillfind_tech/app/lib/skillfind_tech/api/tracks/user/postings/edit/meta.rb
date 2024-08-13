# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Edit
            module Meta
              include ::Helpers::MetaLocalizations

              TRACK = 'user/postings/edit'

              EN_PATH = '^edit-posting/(?<posting_id>\d+)$'
              PL_PATH = '^pl\/edytuj-ogloszenie/(?<posting_id>\d+)$'
  
              UNLOCALIZED_PATH = {
                en: %r{#{EN_PATH}},
                pl: %r{#{PL_PATH}},
              }.freeze

              private

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def metaLozalizationPath
                @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/postings/edit/localizations/meta/#{lang}.json"
              end

              def render
                {
                  "#{TRACK}": true,
                }
              end

              def links
                {
                  'current/en': ::SkillfindTech::Api::Tracks::User::Postings::Edit::Linker.new(posting: posting, lang: :en).call,
                  'current/pl': ::SkillfindTech::Api::Tracks::User::Postings::Edit::Linker.new(posting: posting, lang: :pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
