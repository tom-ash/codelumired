# frozen_string_literal: true

module MapawynajmuPl
  class DeletedListing < ApplicationRecord
    establish_connection :mapawynajmu_pl
    self.table_name = 'deleted_announcements'

    after_create :move_pictures

    def move_pictures
      pictures.each do |picture|
        database_key = "#{id}/#{picture['database']}"
        begin
          PersistedObject.new(
            "announcements/#{database_key}"
          ).move_to("deleted_announcements/#{database_key}")
        rescue
          puts 'The provided key does not exist!'
        end
      end
    end

    private

    def pictures
      @pictures ||= original_announcement['pictures']
    end
  end
end