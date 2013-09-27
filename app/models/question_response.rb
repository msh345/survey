class QuestionResponse < ActiveRecord::Base
	belongs_to :question
	belongs_to :survey_submission
end
