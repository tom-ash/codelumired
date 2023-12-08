class AddPositionToQuestionAnswers < ActiveRecord::Migration[7.0]
  def up
    remove_column :question_answers, :sequence_letter
    add_column :question_answers, :position, :integer, limit: 2
  end
end
