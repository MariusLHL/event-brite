# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#<Event id: nil, title: nil, content: nil, user_id: nil, duration: nil, start: nil, created_at: nil, updated_at: nil>
#<User id: nil, first_name: nil, last_name: nil, description: nil, email: nil, password_digest: nil, age: nil, created_at: nil, updated_at: nil>
#<JoinEvent id: nil, user_id: nil, event_id: nil, created_at: nil, updated_at: nil>
User.destroy_all

10.times do
 user = User.create(first_name:Faker::Name.first_name  , last_name: Faker::Name.last_name , description: Faker::Quote.famous_last_words , email: Faker::Internet.email, age: rand(18..78), password: "password")
  user.errors
end
