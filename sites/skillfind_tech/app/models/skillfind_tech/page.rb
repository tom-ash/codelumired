# frozen_string_literal: true

module SkillfindTech
  class Page < ::Page
    establish_connection :skillfind_tech

    belongs_to :user, foreign_key: :author_id
    belongs_to :category, foreign_key: :category_id

    private

    def site
      @site ||= SkillfindTech
    end

    def langs
      @langs ||= %i[en pl]
    end
  end
end
