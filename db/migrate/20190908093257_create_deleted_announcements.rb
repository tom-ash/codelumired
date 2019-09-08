class CreateDeletedAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :deleted_announcements do |t|
      t.jsonb :original_announcement, null: false

      t.timestamps
    end
  end
end
