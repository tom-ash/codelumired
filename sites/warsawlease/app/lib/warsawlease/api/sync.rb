# frozen_string_literal: true

module Warsawlease
  module Api
    class Sync < ::Api::Sync
      helpers Warsawlease::Api::Announcement::Helpers::Tracks
      helpers Warsawlease::Api::Announcement::Helpers::Filters

      helpers do
        def track_data
          @track_data ||= JSON.parse(File.read('./sites/warsawlease/app/tracks/meta_data.json'))
        end
      end

      before { handle_announcement_tracks }
    end
  end
end
