# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Show
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Posting::Show::State
            include ::SkillfindTech::Api::Tracks::Posting::Show::Meta
            include ::SkillfindTech::Api::Tracks::Posting::Common::Skills
            include ::SkillfindTech::Api::Tracks::Posting::Common::Postings
            include ::SkillfindTech::Api::Tracks::Posting::Common::Industries

            private

            def control
              {
                isPinsDrawn: false,
                mapOptions: {
                  center: {
                    lat: posting.lat,
                    lng: posting.lng,
                  },
                  zoom: 9,
                },
              }
            end

            def data
              {
                postings: postings,
                pages: [], # TODO!
                articles: [], # TODO!
                posting: serializedPosting,
              }
            end

            def postingId
              @postingId ||= match_data[:posting_id]
            end

            def posting
              @posting ||= ::SkillfindTech::Posting.includes(:user).find(postingId)
            end

            def inputs
              {
                skillOptions: skillOptions,
                selectedSkills: selectedSkills,
              }
            end

            def serializedPosting
              @serializedPosting ||= {
                id: posting.id,
                logo: posting.user.logo,
                businessName: posting.user.business_name,
                industry: getIndustry(posting.user.industry)[lang.to_s],
                skills: postingSelectedSkills(posting),
                b2b: posting.b2b,
                b2bMin: posting.b2b_min,
                b2bMax: posting.b2b_max,
                employment: posting.employment,
                employmentMin: posting.employment_min,
                employmentMax: posting.employment_max,
                country: posting.country,
                locality: posting.locality,
                sublocality: posting.sublocality,
                cooperationMode: posting.cooperation_mode,
                lat: posting.lat,
                lng: posting.lng,
              }
            end
          end
        end
      end
    end
  end
end
