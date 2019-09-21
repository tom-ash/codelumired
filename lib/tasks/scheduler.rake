task delete_inactive_announcements: :environment do
  Announcement.where('active_until < ?', 1.day.ago).destroy_all
end