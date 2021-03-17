# frozen_string_literal: true

module Warsawlease
  module Api
    class Base < ::Api::Base
      SITENAME = 'Warsawlease'
      ALLOWED_UPDATE_ATTRS = %w[first_name last_name business_name].freeze

      helpers do
        def site_name
          @site_name ||= SITENAME
        end

        def allowed_update_attrs
          @allowed_update_attrs ||= ALLOWED_UPDATE_ATTRS
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
      mount ::Warsawlease::Api::Announcement::Create => 'announcement/create'
      mount ::Warsawlease::Api::Announcement::CreateWithUser => 'announcement/create-with-user'
      mount ::Warsawlease::Api::Announcement::GetPhoneNumber => 'announcement/get-phone-number/:id'
      mount ::Warsawlease::Api::Announcement::Update => 'announcement/update/:id'
    end
  end
end
