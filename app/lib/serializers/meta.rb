# frozen_string_literal: true

module Serializers
  class Meta
    def initialize(track_data:, track:, lang:)
      @track_data = track_data
      @track = track
      @lang = lang
    end

    def call
      track_data.with_indifferent_access.dig(track, lang) || {}
    end

    private

    attr_reader :track_data, :track, :lang
  end
end
