require 'faker'
require "open-uri"

Booking.destroy_all
Space.destroy_all
User.destroy_all

adresses = [
  "Quai d'Ouchy 1, 1006 Lausanne",
  "Chemin du Laviau 9, 1025 Saint-Sulpice",
  "Chemin de la Balle 1, 1134 Vufflens-le-Château",
  "Place de la Cathédrale, 1005 Lausanne",
  "Avenue Warnery 8, 1110 Morges",
  "Route de Duillier 50, 1260 Nyon 1",
  "Chemin du Tolovaux 12, 1070 Puidoux",
  "Rue Michel-Servet 1, 1206 Genève",
  "Chemin du Petit-Bel-Air 2, 1226 Thônex",
  "Chemin des Grands Vignes 9, 1275 Chéserex"
]

counter = 0

# Create users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: '123456',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    info_host: Faker::Quote.matz
  )
  Space.create!(
    user_id: User.last.id,
    title: ['Big room', 'Small room', 'Living room', 'Appartement with balcony'].sample,
    category: ['Small', 'Large'].sample,
    price_day: Faker::Commerce.price,
    address: adresses[counter],
    info_space: Faker::Quote.jack_handey,
    available: true
  )
  counter += 1
end

images = [
  'https://images.unsplash.com/photo-1563567795533-75e32e10f361?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGZsYXR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8YXBwYXJ0bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1622763853951-ded5a33cb724?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YXBwYXJ0bWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1622763846204-5d0bf5031e06?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1622763851108-b82f98dcd86c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1585077210671-c162569fbbf0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1546695950-187ecfb4a91a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1589103869096-9d4c373fe7fb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1613650428515-3f2280e6038d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODB8fGFwcGFydG1lbnR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1636928297647-7575203ae73b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA5fHxhcHBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
]

counter_image = 0
spaces = Space.all

10.times do
  image = URI.open(images[counter_image])
  spaces[counter_image].photo.attach(io: image, filename: 'nes.png', content_type: 'image/png')
  counter_image += 1
end

user_images = [
  'https://images.unsplash.com/photo-1510227272981-87123e259b17?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=3759e09a5b9fbe53088b23c615b6312e',
  'https://api.uifaces.co/our-content/donated/KtCFjlD4.jpg',
  'https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&ixid=eyJhcHBfaWQiOjE3Nzg0fQ',
  'https://randomuser.me/api/portraits/women/17.jpg',
  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb',
  'https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=aa3a807e1bbdfd4364d1f449eaa96d82',
  'https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=d5849d81af587a09dbcf3f11f6fa122f',
  'https://api.uifaces.co/our-content/donated/VxDQx_gA.jpg',
  'https://randomuser.me/api/portraits/men/91.jpg'
]

users = User.all
counter_users = 0

10.times do
  user_image = URI.open(user_images[counter_users])
  users[counter_users].photo.attach(io: user_image, filename: 'nes.png', content_type: 'image/png')
  counter_users += 1
end
