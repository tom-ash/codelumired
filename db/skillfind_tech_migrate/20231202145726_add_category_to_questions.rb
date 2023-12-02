class AddCategoryToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :category, type: :uuid, foreign_key: { to_table: :categories }, null: false
  end
end
