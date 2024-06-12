class AddVerifiedToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :verified, :boolean, null: false, default: false
  end
end
