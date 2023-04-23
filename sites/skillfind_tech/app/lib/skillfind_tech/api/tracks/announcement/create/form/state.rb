# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            module State

              private

              def texts
                {
                  en: {
                    title: 'Add Posting',
                    skills: 'Skills',
                    submit: 'Submit',
                  },
                  pl: {
                    title: 'Dodaj ogłoszenie',
                    skills: 'Umiejętności',
                    submit: 'Wyślij',
                  },
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
