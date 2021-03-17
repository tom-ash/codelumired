# frozen_string_literal: true

namespace :warsawlease do
  desc 'Deletes inactive announcements.'
  task delete_inactive_announcements: :environment do
    Warsawlease::Announcement.where('active_until < ?', 1.day.ago).destroy_all
  end

  desc 'Warsawlease Grape Routes'
  task routes: :environment do
    ::Warsawlease::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end

  desc 'Migrates user data for new user architecture.'
  task migrate_user_data: :environment do
    ::Warsawlease::User.all.each do |user|
      phone_data = user.phone
      user.update(
        confirmed: true,
        email_confirmed_at: user.created_at,
        country_code: phone_data['code'],
        phone_number: phone_data['body']
      )
    end
  end
end
