# frozen_string_literal: true

module Warsawlease
  module Api
    class Base < ::Api::Base
      SITENAME = 'Warsawlease'
      SITE_TITLE = 'warsawlease.pl'
      ALLOWED_UPDATE_ATTRS = %w[first_name last_name business_name].freeze
      PAGE_LANGS = %w[pl en].freeze

      helpers do
        def site_name
          @site_name ||= SITENAME
        end

        def site_title
          @site_title ||= SITE_TITLE
        end

        def page_langs
          @page_langs ||= PAGE_LANGS
        end

        def allowed_update_attrs
          @allowed_update_attrs ||= ALLOWED_UPDATE_ATTRS
        end

        def current_announcement
          id = params[:id] || route_url.match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)[1]
          @current_announcement ||= ::Warsawlease::Announcement.find(id)
        end

        def authorize_for_announcement!
          error!('Unauthorized!.', 401) unless current_user&.id == current_announcement.user_id
        end
      end

      mount ::Warsawlease::Api::Sync => 'sync'
      mount ::Warsawlease::Api::Announcement::Create::AsUser => 'announcement/create/as-user'
      mount ::Warsawlease::Api::Announcement::Create::WithUser => 'announcement/create/with-user'
      mount ::Warsawlease::Api::Announcement::GetTile => 'announcement/get-tile/:id'
      mount ::Warsawlease::Api::Announcement::GetPhoneNumber => 'announcement/get-phone-number/:id'
      mount ::Warsawlease::Api::Announcement::Update::Views => 'announcement/update/views/:id'
      mount ::Warsawlease::Api::Announcement::Update::Form => 'announcement/update/form/:id'
      mount ::Warsawlease::Api::Announcement::Update::ActiveUntil => 'announcement/update/active-until/:id'
      mount ::Warsawlease::Api::Announcement::Update::Visible => 'announcement/update/visible/:id'
      mount ::Warsawlease::Api::Announcement::Delete => 'announcement/delete/:id'
    end
  end
end
