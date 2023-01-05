# frozen_string_literal: true

module SoundofIt
  class Page < ::Page
    establish_connection :soundof_it

    private

    def site
      @site ||= SoundofIt
    end

    def langs
      @langs ||= %i[en pl]
    end
  end
end
