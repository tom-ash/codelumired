module Codelumi
  class Page < ::Page
    establish_connection :codelumi

    private

    def site
      @site ||= Codelumi
    end

    def langs
      @langs ||= %w[pl en]
    end
  end
end
