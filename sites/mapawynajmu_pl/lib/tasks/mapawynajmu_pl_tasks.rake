# frozen_string_literal: true

namespace :mapawynajmu_pl do
  desc 'Deletes inactive announcements.'
  task delete_inactive_announcements: :environment do
    MapawynajmuPl::Announcement.where('active_until < ?', 1.day.ago).destroy_all
  end

  desc 'MapawynajmuPl Grape Routes'
  task routes: :environment do
    ::MapawynajmuPl::Api::Base.routes.each do |api|
      method = api.request_method.ljust(10)
      path = api.path
      puts "#{method} #{path}"
    end
  end

  desc 'Migrates user data for new user architecture.'
  task migrate_user_data: :environment do
    ::MapawynajmuPl::User.all.each do |user|
      phone_data = user.phone
      user.update(
        confirmed: true,
        email_confirmed_at: user.created_at,
        country_code: phone_data['code'],
        phone_number: phone_data['body']
      )
    end
  end

  desc 'Prepares user verification for new user architecture.'
  task prepare_user_verification: :environment do
    ::MapawynajmuPl::User.all.each do |user|
      user.update!(verification: []) if user.verification&.class != Array
    end
  end

  desc 'Generate encryption :key, :iv and :salt.'
  task generate_encryption_key_iv_and_salt: :environment do
    { key: 32, iv: 16, salt: 128 }.each do |k, length|
      puts "#{k}: \"#{Base64.encode64(SecureRandom.random_bytes(length)).delete("\n")}\""
    end
  end

  desc 'Generate encryption :key, :iv and :salt.'
  task send_before_name_change_email: :environment do
    users = MapawynajmuPl::User.all

    users.each do |user|
      puts "Sending \"Before Name Change Email\" for user with id #{user.id}"

      if NotifierMailer.before_name_change(user).deliver_now
        puts 'Success'
      else
        puts 'Failure'
      end

      puts '---'

      sleep(1)
    end
  end
end
