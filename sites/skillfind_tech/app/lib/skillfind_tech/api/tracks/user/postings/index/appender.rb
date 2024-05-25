# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Index
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::User::Postings::Index::Meta
              include ::SkillfindTech::Api::Tracks::Posting::Common::Skills
              include ::SkillfindTech::Api::Tracks::Posting::Common::Postings
              include ::SkillfindTech::Api::Tracks::Posting::Common::Industries

              private

              def authorize!
                raise ::Api::UnauthorizedError unless authenticated_user.present?
              end

              def data
                {
                  postings: editable_postings,
                }
              end

              def postings_user_id
                @postings_user_id ||= authenticated_user.id
              end

              def editable_postings
                postings.map do |posting|
                  posting.merge(
                    link: ::SkillfindTech::Api::Tracks::User::Postings::Edit::Linker.new(posting: posting, lang: lang).call,
                  )
                end
              end

              def control
                {
                  isPinsDrawn: false,
                  mapOptions: {
                    center: {
                      lat: 52,
                      lng: 19,
                    },
                    zoom: 6.7,
                  },
                }
              end

              def asset_names
                @asset_names ||= %i[
                  chevron
                  facebook_square
                  linkedin_square
                  twitter_square
                  home
                  collegeCap
                  flaskVial
                  marker
                  office
                  building
                  treeCity
                  magnifyingGlass
                  # listOl
                ] + header_asset_names + industryIcons
              end
            end
          end
        end
      end
    end
  end
end
