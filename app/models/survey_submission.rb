class SurveySubmission < ActiveRecord::Base
	belongs_to :survey
	belongs_to :user
	has_many :question_responses
  has_many :questions, through: :question_responses
end
