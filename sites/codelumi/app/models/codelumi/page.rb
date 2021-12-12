module Codelumi
  class Page < ::Page
    establish_connection :codelumi

    private

    def site
      @site ||= Codelumi
    end

    def langs
      @langs ||= %i[en]
    end
  end
end
