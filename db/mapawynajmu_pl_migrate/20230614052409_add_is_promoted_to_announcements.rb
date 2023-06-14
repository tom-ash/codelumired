class AddIsPromotedToAnnouncements < ActiveRecord::Migration[7.0]
  def change
    add_column :announcements, :is_promoted, :boolean
  end
end
