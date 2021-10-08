# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Resetting database"

Favorite.destroy_all
Review.destroy_all
Invite.destroy_all
Group.destroy_all
Event.destroy_all
Location.destroy_all
User.destroy_all

puts "Creating test user..."
User.create!(
    username: "testing",
    password: "testing",
    email: "testing@testing.com",
    address: Faker::Address.street_address
    )
puts "Test user created!"

puts "Creating 20 users..."
20.times do |i|
  User.create!(
    username: "username#{i}",
    password: "testing",
    email: "testing#{i}@testing.com",
    address: Faker::Address.street_address
    )
end
puts "Users created!"

puts "Creating 20 locations..."
20.times do |i|
  owner = User.all.sample
  Location.create(
    address: Faker::Address.street_address,
    owner: owner,
    name: Faker::Restaurant.name
    )
end
puts "Locations created!"

puts "Creating 20 events..."
suffixes = ["Class", "Masterclass", "Experience", "Workshop", "Adventure", "Evening", "Night"]
20.times do |i|
  suffix = suffixes.sample
  activity = Faker::Hobby.activity
  location = Location.all.sample
  event_durations = [30, 60, 90, 120, 180]
  Event.create(
    name: "#{activity} #{suffix}",
    category: activity,
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    duration: event_durations.sample,
    location: location,
    host: User.all.sample,
    description: Faker::Hipster.paragraph,
    price: rand(15..100)
    )
end
puts "Events created!"

puts "Creating 10 groups..."
  10.times do |i|
    Group.create(
      name: Faker::Movies::StarWars.call_sign,
      owner: User.all.sample,
      event: Event.all.sample
      )
  end
puts "Groups created!"

puts "Creating 20 invites..."
boolean = [true, false]
  20.times do |i|
    Invite.create(
      owner: User.all.sample,
      attendee: User.all.sample,
      group: Group.all.sample,
      message: Faker::Games::Witcher.quote,
      wishlist: boolean.sample,
      confirmed: boolean.sample
      )
  end
# Faker::TvShows::StrangerThings.quote
# Faker::Games::Witcher.quote
puts "Invites created!"

puts "Creating 50 favorites..."
  50.times do
    Favorite.create(
      owner: User.all.sample,
      event: Event.all.sample
      )
    Favorite.create(
      owner: User.all.sample,
      user: User.all.sample
      )
  end
puts "Favorites created!"

puts "Creating 50 user reviews..."
  50.times do |i|
    Review.create(
      reviewer: User.all.sample,
      user: User.all.sample,
      rating: rand(1..5),
      content: Faker::Lorem.paragraph(sentence_count: 2)
      )
  end
puts "User reviews created!"

puts "Creating 50 event reviews..."
  50.times do |i|
    Review.create(
      reviewer: User.all.sample,
      event: Event.all.sample,
      rating: rand(1..5),
      content: Faker::Lorem.paragraph(sentence_count: 2)
      )
  end
puts "Event reviews created!"

puts "Reviews created!"

puts "Population complete! :)"
