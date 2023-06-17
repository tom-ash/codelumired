class ChangeIsPromotedDefaultToFalseInAnnouncements < ActiveRecord::Migration[7.0]
  def change
    change_column_null(
      :announcements,
      :is_promoted,
      false,
      false
    )

    change_column_default(
      :announcements,
      :is_promoted,
      from: nil,
      to: false
    )
  end
end
