# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Admin User",
             email: "admin@bookmarkdapp.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "ex-#{n+1}@bookmarkdapp.com"
  password = "password"
  User.create!(name: name, 
               email: email,
               password: password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  name = Faker::Lorem.word
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.library.shelves.create!(name: name, description: description) }
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.word
  author = Faker::Name.name
  publisher = Faker::Lorem.word
  isbn = Faker::Code.isbn
  users.each { |user| user.library.books.create!(title: title, author: author, publisher: publisher, isbn: isbn) }
end