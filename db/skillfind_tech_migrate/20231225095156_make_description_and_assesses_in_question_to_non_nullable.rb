class MakeDescriptionAndAssessesInQuestionToNonNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :questions, :description, false
    change_column_null :questions, :assesses, false
  end
end
