50.times do
  User.create(username: Faker::Name.name, password: "123")
end


100.times do
  Post.create(title: Faker::Lorem.sentence(word_count = 4, supplemental = false, random_words_to_add = 6), text: Faker::Lorem.paragraphs(sentence_count = 1, supplemental = false).join(""),user_id: rand(1..50))
end

300.times do
  Comment.create(text: Faker::Lorem.paragraphs(sentence_count = 1, supplemental = false).join(""), post_id: rand(1..100), user_id: rand(1..50))
end
