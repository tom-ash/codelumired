class CreateRedirects < ActiveRecord::Migration[6.1]
  def change
    create_table :redirects do |t|
      t.belongs_to :added_by, foreign_key: { to_table: :users }, null: false
      t.string :original_url, null: false, index: { unique: true }
      t.string :redirected_url, null: false
      t.integer :status, null: false
      t.text :reason

      t.timestamps
    end
  end
end
