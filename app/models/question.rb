class Question < ActiveRecord::Base
	belongs_to :survey
	has_one :question_response
end
