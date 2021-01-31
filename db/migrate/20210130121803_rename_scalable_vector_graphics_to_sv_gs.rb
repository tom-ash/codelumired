class RenameScalableVectorGraphicsToSvGs < ActiveRecord::Migration[6.0]
  def change
    rename_table :svgs, :svgs
  end
end
