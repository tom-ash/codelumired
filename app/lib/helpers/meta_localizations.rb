# frozen_string_literal: true
module Helpers
  module MetaLocalizations
    include ::Helpers::Localizations

    private

    def metaLocalizations
      @metaLocalizations ||= getLocalizations(metaLozalizationPath)
    end

    def title
      @title = metaLocalizations[:title]
    end

    def keywords
      @keywords = metaLocalizations[:keywords]
    end

    def description
      @keywords = metaLocalizations[:description]
    end
  end
end
