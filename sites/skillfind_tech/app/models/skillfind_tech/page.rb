# frozen_string_literal: true

module SkillfindTech
  class Page < ::Page
    establish_connection :skillfind_tech

    private

    def site
      @site ||= SkillfindTech
    end

    def langs
      @langs ||= %i[en pl]
    end
  end
end
