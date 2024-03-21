class AddCooperationModeToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :cooperation_mode, :string, null: false

    remove_column :postings, :office
    remove_column :postings, :hybrid
    remove_column :postings, :remote
  end
end
