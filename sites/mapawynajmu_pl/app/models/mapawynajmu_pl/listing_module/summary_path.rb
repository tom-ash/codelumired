# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module SummaryPath
      def summary_path(lang)
        @lang = lang.to_sym

        "#{prefix}/#{id}"
      end

      private

      def prefix
        {
          pl: 'podsumowanie-dodanego-ogloszenia',
          en: 'added-announcement-summary'
        }[@lang]
      end
    end
  end
end
