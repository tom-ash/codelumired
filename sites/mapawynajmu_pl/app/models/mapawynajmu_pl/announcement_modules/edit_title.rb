# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module EditTitle
      def edit_title(lang)
        @lang = lang.to_sym

        "#{lang == :pl ? 'Edytuj ogłoszenie nr' : 'Edit Listing No.'} #{id}"
      end

      attr_reader :lang
    end
  end
end
