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

              def localizations
                @localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/postings/index/localizations/#{lang}.json")
              end

              def authorize!
                raise ::Api::UnauthorizedError unless authenticated_user.present?
              end
              
              def texts
                localizations
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
                    applications: applications(posting[:id]),
                  )
                end
              end

              def applications(posting_id)
                ::SkillfindTech::PostingApplication.where(posting_id: posting_id).all
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
                  filePdf
                  envelope
                  phone
                  linkedin_square
                  github
                ] + header_asset_names + industryIcons
              end
            end
          end
        end
      end
    end
  end
end
