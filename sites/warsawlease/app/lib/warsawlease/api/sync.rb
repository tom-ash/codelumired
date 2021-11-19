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

        def append_links
          state.merge!(
            links: {
              'root': ::Warsawlease::Api::Announcement::Links::Root::Build.new(lang).call,
              'announcement/create': ::Warsawlease::Api::Announcement::Links::Create::Build.new(lang).call
            }
          )
        end
      end

      before do
        handle_announcement_tracks
        append_links
      end
    end
  end
end
