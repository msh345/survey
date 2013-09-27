class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.integer :user_id
  		t.string :title
  		t.string :url
  		t.timestamps
  	end
  end
end