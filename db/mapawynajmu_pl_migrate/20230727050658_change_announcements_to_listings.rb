class ChangeAnnouncementsToListings < ActiveRecord::Migration[7.0]
  def change
    rename_table :announcements, :listings
  end
end
