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
                {
                  href: href,
                  href_lang: lang,
                  path: path,
                  # TODO: Add label & title.
                }
              end

              private

              def href
                "#{protocol_and_domain}/#{path}"
              end

              def path
                @path ||= begin
                  path_prefix = {
                    pl: PATH_PL,
                    en: PATH_EN,
                  }[lang]

                  "#{path_prefix}/#{decorators[:user_id]}"
                end
              end
            end
          end
        end
      end
    end
  end
end
