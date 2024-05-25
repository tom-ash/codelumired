# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Index
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::User::Postings::Index::Meta

              private

              def label
                {
                  en: 'My Postings',
                  pl: 'Moje ogłoszenia',
                }[lang]
              end

              def icon
                'listOl'
              end
            end
          end
        end
      end
    end
  end
end
