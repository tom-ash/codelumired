# frozen_string_literal: true

module Warsawlease
  class Page < ::Page
    establish_connection :warsawlease

    belongs_to :user, foreign_key: :author_id

    private

    def site
      @site ||= Warsawlease
    end

    def langs
      @langs ||= %i[pl en]
    end
  end
end
