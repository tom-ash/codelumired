class RemoveNotNullConstraintFromActiveUntilInListings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :listings, :active_until, true
  end
end
