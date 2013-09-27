class Question < ActiveRecord::Base
	belongs_to :survey_id
	has_many :question_responses
end
