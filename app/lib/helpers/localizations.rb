# frozen_string_literal: true
module Helpers
  module Localizations
    private

    def getLocalizations(path)
      JSON.parse(File.read(path)).deep_symbolize_keys
    end
  end
end
