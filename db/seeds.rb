# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!( email: "user@user.com", password: "pas123", password_confirmation: "pas123", confirmed_at: Date.today)

3.times do
  User.create!(
    email:                 Faker::Internet.email,
    password:              "pas123",
    password_confirmation: "pas123",
    confirmed_at: Date.today
  )
end
users = User.all

10.times do
  Topic.create!(
    title: Faker::Company.bs, # I'd rather see this than Lorem ipsum
    user: users.sample
  )
end
topics = Topic.all

75.times do
  Bookmark.create!(
    url: Faker::Internet.url,
    topic: topics.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Topic.count} items created."
puts "#{Bookmark.count} bookmarks created."
