# frozen_string_literal: true

namespace :warsawlease do
  desc 'Deletes inactive announcements.'
  task delete_inactive_announcements: :environment do
    Warsawlease::Announcement.where('active_until < ?', 1.day.ago).destroy_all
  end
end
