class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :views, null: false
      t.string :company_name, null: false
      t.integer :company_size, null: false
      t.boolean :remote, null: false
      t.boolean :hybrid, null: false
      t.boolean :office, null: false
      t.string :country, null: false
      t.string :locality, null: false
      t.string :sublocality
      t.string :street
      t.boolean :employment, null: false
      t.boolean :b2b, null: false
      t.integer :employment_min
      t.integer :employment_max
      t.integer :b2b_min
      t.integer :b2b_max
      t.text :description

      t.timestamps
    end
  end
end
