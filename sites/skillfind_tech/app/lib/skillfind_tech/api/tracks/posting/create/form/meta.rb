# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Create
          module Form
            module Meta
              include ::Helpers::MetaLocalizations

              TRACK = 'listings/new/form'

              UNLOCALIZED_PATH = {
                en: 'add-posting',
                pl: 'pl/dodaj-ogloszenie',
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'TODO',
                pl: 'TODO',
              }.freeze

              private

              def track
                @track ||= TRACK
              end

              def label
                {
                  en: 'Add Posting',
                  pl: 'Dodaj ogłoszenie',
                }[lang]
              end

              def icon
                'plus'
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def metaLozalizationPath
                @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/create/form/localizations/meta/#{lang}.json"
              end

              def render
                {
                  'visitor': true,
                  'postings': true,
                  'postings/new': true,
                  'postings/new/form': true,
                }
              end

              def links
                {
                  'current/en': ::SkillfindTech::Api::Tracks::Posting::Create::Form::Linker.new(:en).call,
                  'current/pl': ::SkillfindTech::Api::Tracks::Posting::Create::Form::Linker.new(:pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
