# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Show
          module Meta
            TRACK = 'postings/show'

            POSTINGS_SHOW_EN = '(?<posting_id>\d+)-.*'
            POSTINGS_SHOW_PL = '(?<posting_id>\d+)-.*'

            UNLOCALIZED_PATH = {
              en: %r{^#{POSTINGS_SHOW_EN}$},
              pl: %r{^pl\/#{POSTINGS_SHOW_PL}$},
            }.freeze

            private

            def match_data
              @match_data ||= unlocalized_path[lang].match(url)
            end

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
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

            def title
              @title ||=  "#{posting.position} | skillfind.tech"
            end

            def render
              {
                'visitor': true,
                'postings': true,
                'postings/show': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Posting::Show::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Posting::Show::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
