# frozen_string_literal: true

module Warsawlease
  module Api
    class Sync < ::Api::Sync
      helpers do
        def handle_announcement_tracks
          if ['root', 'announcement/index/catalogue'].include?(track)
            announcements = ::Warsawlease::Queries::Announcement::Index::Visitor.new.call
            serialized_announcements = ::Warsawlease::Serializers::Announcement::Index::Visitor.new(announcements).call
            state.merge!('announcement/index/data': { announcements: serialized_announcements, amount: announcements.count })
          end

          if route_url.match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)
            announcement = ::Warsawlease::Queries::Announcement::ById.new(id: $1).call
            state.merge!('announcement/show/data': ::Warsawlease::Serializers::Announcement::Show.new(announcement).call)
            meta.merge!(::Warsawlease::Serializers::Announcement::ShowMeta.new(announcement: announcement, lang: lang).call)
          end

          if track == 'announcement/index/my'
            @user ||= ::Commands::User::Authorize::AccessToken.new(access_token: access_token, site_name: 'Warsawlease' ).call
            announcements = ::Warsawlease::Queries::Announcement::Index::User.new(user_id: @user.id).call
            serialized_announcements = ::Warsawlease::Serializers::Announcement::Index::User.new(announcements).call
            state.merge!('announcement/index/data': { announcements: serialized_announcements, amount: announcements.count })
          end

          if track == 'announcement/create/summary'
            authorize_for_announcement!

            state.merge!('announcement/create/data': { announcement: ::Warsawlease::Serializers::Announcement::Show.new(current_announcement).call })
          end

          if track == 'announcement/edit'
            announcement_id = route_url.match(%r{(edytuj-ogloszenie|edit-announcement)/(\d+)})[2].to_i
            announcement = ::Warsawlease::Queries::Announcement::ById.new(id: announcement_id).call
            state.merge!('announcement/create/data': { announcement: ::Warsawlease::Serializers::Announcement::Edit.new(announcement).call })
          end
        end
      end

      before { handle_announcement_tracks }
    end
  end
end
