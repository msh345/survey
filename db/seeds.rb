50.times do
  User.create(username: Faker::Name.name, password: "123")
end

100.times do
	random_string = (0...8).map { (65 + rand(26)).chr }.join
	Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string, user_id: rand(1..50))
end

900.times do
	SurveySubmission.create(user_id: rand(1..150), survey_id: rand(1..100), gender: ["male","female"].sample, age: rand(18..65))
end

SurveySubmission.where("user_id > ?", 50).each do |s| 
	s.user_id = nil
	s.save
end

600.times do
	Question.create(survey_id: rand(1..100), title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6))
end

# 600.times do
# 	Survey.all.questions[i]

# 	Question.all.each do |question|
# 		question.questionresponses.create()
# 	# QuestionResponses.create(survey_submission_id: rand(1..900), question_id: rand(1..600))
# end