# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Edit
        module Meta
          TRACK = 'image/edit'

          UNLOCALIZED_PATH = {
            pl: %r{^obrazy/.+$},
            en: %r{^images/.+$},
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Edytuj obraz',
            en: 'Edit Image',
          }.freeze

          private

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
              pl: 'TODO',
              en: 'TODO',
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'TODO',
              en: 'TODO',
            }.freeze
          end

          def render
            {
              visitor: true,
              image: true,
              'image/edit': true,
            }
          end

          def links
            pathPl = image.edit_link(:pl)
            pathEn = image.edit_link(:en)

            {
              'current/pl': {
                href: image.edit_link(:pl),
                hrefLang: :pl,
                title: title,
                label: title,
              },
              'current/en': {
                href: image.edit_link(:en),
                hrefLang: :en,
                title: title,
                label: title,
              },
            }
          end
        end
      end
    end
  end
end
