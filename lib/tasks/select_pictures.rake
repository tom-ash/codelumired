# frozen_string_literal: true

task select_pictures: :environment do
  Announcement.all.each do |announcement|
    puts "ID: #{announcement.id}"

    announcement.pictures.each do |picture|
      database_key = "#{announcement.id}/#{picture['database']}"
      PersistedObject.new("announcements/#{database_key}").copy_to(
        "selected_announcements/#{database_key}"
      )
    end
  end
end
