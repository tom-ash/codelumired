class CreateDerivedCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :derived_ciphers do |t|
      t.string :iv
      t.string :salt

      t.timestamps
    end
  end
end
