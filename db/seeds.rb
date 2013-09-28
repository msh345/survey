50.times do
  User.create(username: Faker::Name.name, password: "123")
end

150.times do
	random_string = (0...8).map { (65 + rand(26)).chr }.join
	User.find(rand(1..50)).surveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string)
end

450.times do
  Survey.find(rand(1..150)).questions << Question.create(title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6))
end

1000.times do
  survey_submissions = Survey.find(rand(1..150)).survey_submissions << SurveySubmission.create(user_id: rand(1..150), gender: ["male","female"].sample, age: rand(18..65))
  survey = Survey.find(survey_submissions.last.survey_id)
  survey.questions.each do |question|
    QuestionResponse.create(survey_submission_id: survey_submissions.last.id, question_id: question.id, answer: Faker::Lorem.words(num = 3, supplemental = false).join(" "))
  end
end

SurveySubmission.where("user_id > ?", 50).each do |s| 
  s.user_id = nil
  s.save
end

  #Finish results page
  #To do results page, need QuestionResponse table seeded
  #Modify the Create_Survey page to include multiple choice/text dropdown menu
  #Modify the 


# user = User.last
# new_survey = user.surveys << Survey.create(title: "MY NEW SURVEY")
# new_survey.last.questions << [Question.create(title: "How are you?"), Question.create(title: "What's new?)]
# SurveySubmission.create(gender: "male",age: 33)
# submit = _
# Survey.last.update_attributes(url: "xyz")
# Survey.find_by_url("xyz").id
# submit.update_attributes(survey_id: Survey.find_by_url("xyz").id)
# Survey.find_by_url("xyz").questions
