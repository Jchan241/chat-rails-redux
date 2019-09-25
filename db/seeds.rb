# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

SEED_USER_COUNT = 5
SEED_MESSEGE_COUNT = 25


puts 'seeding'

Message.destroy_all
User.destroy_all
Channel.destroy_all

initial_channels = [
  { name: 'general'}, { name: 'paris'}, { name: 'react'}
]

Channel.create!(initial_channels)

puts 'channels created'


puts 'adding users'

SEED_USER_COUNT.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "Password123"
  user.save!
  puts "seeded user #{user}"
end

puts 'users added'


SEED_MESSEGE_COUNT.times do
  message = Message.new
  message.content = Faker::Twitter.user[:status][:text]
  message.user_id = User.pluck('id').sample
  message.channel_id = Channel.pluck('id').sample
  message.save!
end

puts 'messages added'
