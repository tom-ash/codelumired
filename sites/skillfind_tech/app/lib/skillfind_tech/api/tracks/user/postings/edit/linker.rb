# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Edit
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::User::Postings::Edit::Meta

              def initialize(posting:, lang:)
                @posting = posting
                @lang = lang
              end
  
              def call
                {
                  href: href,
                  # hrefLang,
                  # title,
                  label: label,
                }
              end
  
              private
  
              attr_reader :posting, :lang

              def href
                "/#{prefix}/#{posting[:id]}"
              end

              def label
                {
                  en: 'Edytuj',
                  pl: 'Edit',
                }[lang]
              end

              def prefix
                {
                  en: 'edit-posting',
                  pl: 'pl/edytuj-ogloszenie'
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
