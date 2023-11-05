# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Meta

              def call
                # TODO: Add label & title.

                {
                  href: href,
                  href_lang: lang,
                  
                }
              end

              private

              def href
                @href ||= begin
                  path_prefix = {
                    pl: PATH_PL,
                    en: PATH_EN,
                  }[lang]

                  "/#{path_prefix}/#{decorators[:user_id]}"
                end
              end
            end
          end
        end
      end
    end
  end
end
