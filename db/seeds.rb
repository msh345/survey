50.times do
  User.create(username: Faker::Name.name, password: "123")
end