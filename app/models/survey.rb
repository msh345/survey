class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :survey_submissions
	has_many :questions
  has_many :question_responses, through: :questions
end
