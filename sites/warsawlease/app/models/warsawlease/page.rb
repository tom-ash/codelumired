# frozen_string_literal: true

module Warsawlease
  class Page < ::Page
    establish_connection :warsawlease

    private

    def site
      @site ||= Warsawlease
    end

    def langs
      @langs ||= %w[pl en]
    end
  end
end
