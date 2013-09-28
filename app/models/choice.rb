class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :question_responses
end
