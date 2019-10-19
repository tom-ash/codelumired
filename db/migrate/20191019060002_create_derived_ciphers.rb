class CreateDerivedCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :derived_ciphers do |t|
      t.string :iv, null: false
      t.string :salt, null: false

      t.timestamps
    end
  end
end
