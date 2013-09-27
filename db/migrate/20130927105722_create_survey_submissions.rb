class CreateSurveySubmissions < ActiveRecord::Migration
  def change
  	create_table :survey_submissions do |t|
  		t.integer :user_id
  		t.integer :survey_id
  		t.string  :gender
  		t.integer :age
  		t.timestamps
  	end 
  end
end
