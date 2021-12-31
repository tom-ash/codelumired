class RemoveDescriptionNullConstraintsFromAnnouncements < ActiveRecord::Migration[6.0]
  def change
    change_column_null :announcements, :polish_description, true
    change_column_null :announcements, :english_description, true
  end
end
