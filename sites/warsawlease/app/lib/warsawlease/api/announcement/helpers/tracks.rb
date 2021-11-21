# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Helpers
        module Tracks
          extend Grape::API::Helpers

          CATEGORY_VALUES = {
            'apartments' => 2, 'houses' => 3, 'rooms' => 4, 'parking-spaces' => 5,
            'usable-premises' => 1, 'offices' => 0, 'virtual-offices' => 6, 'coworking' => 7
          }.freeze

          private

          def handle_announcement_tracks
            case track
            when 'root'
              ::Warsawlease::Api::Announcement::Tracks::Root::Merge.new(attrs).call
            when 'announcement/index/catalogue'
              ::Warsawlease::Api::Announcement::Tracks::Catalogue::Merge.new(attrs).call
            when 'announcement/create/form'
              ::Warsawlease::Api::Announcement::Tracks::Create::Merge.new(attrs).call
            when 'visitor/contact'
              ::Warsawlease::Api::Visitor::Tracks::Contact::Merge.new(attrs).call
            when 'visitor/terms-of-service'
              ::Warsawlease::Api::Visitor::Tracks::TermsOfService::Merge.new(attrs).call
            when 'visitor/privacy-policy'
              ::Warsawlease::Api::Visitor::Tracks::PrivacyPolicy::Merge.new(attrs).call
            when 'visitor/cookies-policy'
              ::Warsawlease::Api::Visitor::Tracks::CookiesPolicy::Merge.new(attrs).call
            when 'visitor/privacy-settings'
              ::Warsawlease::Api::Visitor::Tracks::PrivacySettings::Merge.new(attrs).call
            when Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Create::Form::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Create::Verification::Appender.new(attrs).call
            end

            if track.match(%r{announcement/index/(map|catalogue)/(.+)})
              announcements = ::Warsawlease::Queries::Announcement::Index::Visitor.new(category: $2, **announcement_filters).call
              serialized_announcements = ::Warsawlease::Serializers::Announcement::Index::Visitor.new(announcements).call
              category_amounts = ::Warsawlease::Queries::Announcement::Index::CategoryAmounts.new({}).call
              state.merge!(
                'announcement/index/data': { current_category: CATEGORY_VALUES[$2], announcements: serialized_announcements, amount: announcements.count }.merge(category_amounts),
                'announcement/index/inputs': { areaMin: area_min.to_s, areaMinInput: area_min.to_s, areaMax: area_max.to_s, areaMaxInput: area_max.to_s }
              )
              meta.merge!(::Warsawlease::Serializers::Announcement::IndexMeta.new(track: track, lang: lang, track_meta_data: track_data).call)
            end

            if route_url.match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)
              announcement = ::Warsawlease::Queries::Announcement::ById.new(id: $1).call
              state.merge!('announcement/show/data': ::Warsawlease::Serializers::Announcement::Show.new(announcement).call)
              meta.merge!(::Warsawlease::Serializers::Announcement::ShowMeta.new(announcement: announcement, lang: lang).call)
            end

            if track == 'announcement/index/user'
              @user ||= ::Commands::User::Authorize::AccessToken.new(access_token: access_token, site_name: 'Warsawlease').call
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
      end
    end
  end
end
