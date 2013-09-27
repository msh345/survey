class Survey < ActiveRecord::Base
	belongs_to :user
	has_many :survey_submissions
	has_many :questions
end
