# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Create users
10.times do
  User.create!(
    email: Faker::Internet.email,
    encrypted_password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    info_host: Faker::Lorem.sentence(word_count: 10),
    address: "#{Faker::Address.street_address}, #{Faker::Address.zip} #{Faker::Address.city}"
  )
  Space.create!(
    user_id: User.last.id,
    title: ['Big room', 'Small room', 'Living room', 'Appartement with balcony'].sample,
    category: ['Small', 'Large'].sample,
    price_day: Faker::Commerce.price,
    info_space: Faker::Lorem.sentence(word_count: 15),
    available: true
  )
end

puts 'Users created'
puts 'Spaces created'
