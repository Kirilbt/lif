require 'faker'
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
