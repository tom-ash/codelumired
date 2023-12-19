class AddHintToQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :question_answers, :hint, :string
  end
end
