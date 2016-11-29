# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( email: "user@user.com", password: "pas123", password_confirmation: "pas123", confirmed_at: Date.today)
User.create!( email: "user2@user.com", password: "pas123", password_confirmation: "pas123", confirmed_at: Date.today)

1.times do
  User.create!(
    email:                 Faker::Internet.email,
    password:              "pas123",
    password_confirmation: "pas123",
    confirmed_at: Date.today
  )
end
users = User.all

2.times do
  Topic.create!(
    title: Faker::Company.bs, # I'd rather see this than Lorem ipsum
    user: users.sample
  )
end
topics = Topic.all

# 9.times do
Bookmark.create!(
  user: users.sample,
  url: "https://www.facebook.com",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "https://www.amazon.com",
  topic: topics.sample
)
# end

Bookmark.create!(
  user: users.sample,
  url: "https://github.com",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "http://haml.info",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "https://twitter.com",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "http://bloc.io/",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "http://exercism.io",
  topic: topics.sample
)

Bookmark.create!(
  user: users.sample,
  url: "https://www.linkedin.com",
  topic: topics.sample
)

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
