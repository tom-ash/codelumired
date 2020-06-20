class ChangeAnnouncementsActiveUntilType < ActiveRecord::Migration[6.0]
  def change
    change_column :announcements, :active_until, :datetime
  end
end
