# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Verify
            class Linker < ::SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::User::New::Verify::Meta

              private

              def href
                "/#{path_prefix}/#{decorators[:id]}"
              end

              def path_prefix
                {
                  en: 'posters/verify',
                  pl: 'pl/ogloszeniodawcy/zweryfikuj',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
