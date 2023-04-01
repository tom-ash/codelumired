# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Redirects
        module Index
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Redirects::Index::Meta
            include ::SkillfindTech::ProtocolAndDomain

            private

            def data
              {
                redirects: ::SkillfindTech::Redirect.all.sort_by(&:original_url),
              }
            end

            def texts
              {
                pl: {
                  addAssetButtonLabel: 'Dodaj przekierowanie',
                },
                en: {
                  addAssetButtonLabel: 'Add Redirect',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
