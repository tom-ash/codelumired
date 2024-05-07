# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Edit
            module Meta
              TRACK = 'user/postings/edit'

              EN_PATH = '^edit-posting/(?<posting_id>\d+)$'
              PL_PATH = '^pl\/edytuj-ogloszenie/(?<posting_id>\d+)$'
  
              UNLOCALIZED_PATH = {
                en: %r{#{EN_PATH}},
                pl: %r{#{PL_PATH}},
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'Edit Posting',
                pl: 'Edytuj ogłoszenie',
              }.freeze

              private

              def label
                'ASDASDASDAS'
              end

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def unlocalized_title
                @unlocalized_title ||= UNLOCALIZED_TITLE
              end

              def unlocalized_keywords
                @unlocalized_keywords ||= {
                  en: 'TODO',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  en: 'TODO',
                }.freeze
              end

              def render
                {
                  "#{TRACK}": true,
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
