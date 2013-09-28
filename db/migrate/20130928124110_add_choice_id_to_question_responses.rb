class AddChoiceIdToQuestionResponses < ActiveRecord::Migration
  def change
    add_column :question_responses, :choice_id, :integer
  end
end
