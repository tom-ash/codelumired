class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, :id => :uuid do |t|
      t.references :announcement, foreign_key: true, null: false
      t.string :payu_order_id, null: false
      t.string :payu_merchant_pos_id, null: false
      t.string :status, null: false
      t.datetime :paid_at
      t.string :product, null: false
      t.string :price, null: false
      t.integer :quantity, null: false
      t.string :currency, null: false

      t.timestamps
    end

    add_index :orders, :payu_order_id, unique: true
  end
end
