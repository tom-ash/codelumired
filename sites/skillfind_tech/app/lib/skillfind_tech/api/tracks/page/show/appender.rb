# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Page
        module Show
          class Appender < ::Api::Tracks::Page::Show::Appender
            include ::SkillfindTech::Api::Tracks::Page::Show::Meta
            include ::SkillfindTech::ProtocolAndDomain

            private

            def data
              super.merge(
                questions: questions
              )
            end

            def questions
              @questions ||= ::SkillfindTech::Question.where(category_id: page.category_id).map do |question|
                question.attributes.merge(
                  href: "/#{question.category["path_#{lang}"]}/#{practiceProblemPath(lang)}/#{question.url}"
                )
              end
            end

            def practiceProblemPath(lang)
              {
                en: 'practice-problems',
                pl: 'cwiczenia',
              }[lang]
            end

            def asset_names
              @asset_names ||= %i[
                userPlus
                signIn
                signOut
                earthGlobe
                home
                magnifyingGlass
              ] + header_asset_names
            end

            # TODO!
            def header_asset_names
              @header_asset_names ||= %i[
                userPlus
                signIn
                signOut
                earthGlobe
                plus
                circleUser
                cog
                listOl
                copyright
              ]
            end
          end
        end
      end
    end
  end
end
