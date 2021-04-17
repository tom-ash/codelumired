# frozen_string_literal: true

module Warsawlease
  module Api
    class Base < ::Api::Base
      SITENAME = 'Warsawlease'
      ALLOWED_UPDATE_ATTRS = %w[first_name last_name business_name].freeze
      PAGE_LANGS = %w[pl en].freeze

      helpers do
        def site_name
          @site_name ||= SITENAME
        end

        def allowed_update_attrs
          @allowed_update_attrs ||= ALLOWED_UPDATE_ATTRS
        end

        def current_announcement
          @current_announcement ||= ::Warsawlease::Announcement.find(params[:id])
        end

        def authorize_for_announcement!
          current_user.id == current_announcement.user_id
        rescue ActiveRecord::RecordNotFound, ::Commands::User::Authorize::AccessToken::AccessTokenError
          error!('Unauthorized!.', 401)
        end

        def page_langs
          @page_langs ||= PAGE_LANGS
        end
      end

      mount ::Api::User::Create::EmailAndPassword => 'user/create/email-and-password'
      mount ::Api::User::Authorize::EmailAndPassword => 'user/authorize/email-and-password'
      mount ::Api::User::Authorize::AccessToken => 'user/authorize/access-token'
      mount ::Api::User::Update::GenericAttr => 'user/update/generic-attr/:name'
      mount ::Api::User::Update::Password => 'user/update/password'
      mount ::Api::User::Update::Email => 'user/update/email'
      mount ::Api::User::Update::Phone => 'user/update/phone'
      mount ::Api::User::Delete => 'user/delete'
      mount ::Api::RemoteAsset::PresignedPost => 'remote-asset/presigned-post'
      mount ::Api::Page::Create => 'page/create'
      mount ::Api::Page::Update => 'page/update'
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
