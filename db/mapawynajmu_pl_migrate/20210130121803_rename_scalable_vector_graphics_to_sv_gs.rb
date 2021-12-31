class RenameScalableVectorGraphicsToSvGs < ActiveRecord::Migration[6.0]
  def change
    rename_table :scalable_vector_graphics, :svgs
  end
end
