50.times do
  User.create(username: Faker::Name.name, password: "123")
end

150.times do
  random_string = (0...8).map { (65 + rand(26)).chr }.join
  User.find(rand(1..50)).surveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string)
end

450.times do
  Survey.find(rand(1..150)).questions << Question.create(title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6), question_type: ["text","multichoice"].sample)
end

1.upto(150) do |i|
  Survey.find(i).questions.each do |question|
    if question.question_type == "multichoice"
      choices = [Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" ")].sample(rand(2..4))
      choices.each do |choice|
        Choice.create(title: choice, question_id: question.id)
      end
    end
  end
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
