class CreateScalableVectorGraphics < ActiveRecord::Migration[6.0]
  def change
    create_table :scalable_vector_graphics do |t|
      t.string :name, null: false, index: { unique: true }
      t.text :path_data, null: false

      t.timestamps
    end
  end
end
