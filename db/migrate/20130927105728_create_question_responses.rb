class CreateQuestionResponses < ActiveRecord::Migration
  def change
  	create_table :question_responses do |t|
  		t.integer :survey_submission_id
  		t.integer :question_id
  		t.string :answer
  		t.timestamps
  	end
  end
end
