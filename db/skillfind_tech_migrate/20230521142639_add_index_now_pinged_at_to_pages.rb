class AddIndexNowPingedAtToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :index_now_pinged_at, :datetime
  end
end
