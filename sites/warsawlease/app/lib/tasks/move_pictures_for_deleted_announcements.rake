# frozen_string_literal: true

task move_pictures_for_deleted_announcements: :environment do
  DeletedAnnouncement.all.each do |deleted_announcement|
    puts "ID: #{deleted_announcement.id}"
    deleted_announcement.move_pictures
  end
end
