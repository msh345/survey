50.times do
  User.create(username: Faker::Name.name, password: "123")
end

100.times do
	Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false))
end

600.times do
	Question.create(survey_id: rand(1..100) ,question: => Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6))
end

600.times do
	QuestionResponses.create(survey_submissions_id: )
end