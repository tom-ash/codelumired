# frozen_string_literal: true

module MapawynajmuPl
  class Page < ::Page
    establish_connection :mapawynajmu_pl

    belongs_to :user, foreign_key: :author_id

    private

    def site
      @site ||= MapawynajmuPl
    end

    def langs
      @langs ||= %i[pl en]
    end
  end
end
