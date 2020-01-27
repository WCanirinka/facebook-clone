# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  User.create!(first_name: name,
               email: email,
               password: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.posts.create!(title: title, content: content) }
end


# Following relationships

# rails db:migrate:reset  //RESET DATABASE
# rails db:seed           //invoke the Rake task using db:seed
