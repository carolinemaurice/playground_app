# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require "open-uri"
require "faker"

Faker::Config.locale = 'fr'

puts "Database cleaning..."
User.destroy_all
Playground.destroy_all

puts "Create users..."

30.times do
  firstname = Faker::Name.first_name
  lastname = Faker::Name.last_name
  phonenumber = Faker::PhoneNumber.cell_phone_in_e164
  user = User.create!(
    first_name: firstname,
    last_name: lastname,
    email: "#{firstname.parameterize.underscore}.#{lastname.parameterize.underscore}@test.com",
    password: "azerty",
    username: "#{firstname.parameterize.underscore}_#{lastname.parameterize.underscore}",
    phone_number: phonenumber
  )
  file = URI.open(Faker::Avatar.image)
  user.avatar.attach(io: file, filename: "#{firstname}.png", content_type: "photo.png")
  puts "#{firstname} #{lastname} created"
end

puts "Create playgrounds..."

grounds = [
  { address: "3 Pierre Laplace, 31000 Toulouse", name: "Terrain Laplace" },
  { address: "8 Av. de Lasbordes, 31500 Toulouse", name: "Terrain de Basketball de l'Hers" },
  { address: "4 All. des Foulques, 31200 Toulouse", name: "Basketball Court" },
  { address: "2 Rue de l'Égalité, 31200 Toulouse", name: "Hoops Factory Toulouse" },
  { address: "28 Rue des Saules, 31170 Tournefeuille", name: "Terrain des Saules" },
  { address: "113 Chem. d'Aussonne, 31700 Blagnac", name: "Terrain de basket Blagnac" },
  { address: "49 Rue de la Menthe, 31170 Tournefeuille", name: "Terrain de basket Tournefeuille" },
  { address: "9 Av. Léonard de Vinci, 31700 Blagnac", name: "Terrain du Grand Noble" },
  { address: "12 Rue des Blés, 31170 Tournefeuille", name: "Panier de basket" },
  { address: "323 Rte de Saint-Simon, 31100 Toulouse", name: "Complexe sportif de la Cépière" },
  { address: "9 All. de Guyenne, 31770 Colomiers", name: "Terrain de basket Vauchere" },
  { address: "31860 Labarthe-sur-Lèze", name: "Halle des Sports ASLB Basket" },
  { address: "rue de la plage, 31150 Fenouillet", name: "Centre Sportif De Fenouillet" },
  { address: "Rue André Broquère, 31150 Fenouillet", name: "Stade Piquepeyre" },
  { address: "42 Av. Augustin Labouilhe, 31650 Saint-Orens-de-Gameville", name: "Basket Saint Orens" },
  { address: "31670 Labège", name: "Gymnase de Labège Village" },
  { address: "Av. de Bayonne,31240 L'Union", name: "Basketball court" },
  { address: "Chem. de Belbèze, 31240 Saint-Jean", name: "Nord Est Toulousain Basket" },
]

descriptions = [
  "Terrain de basket accessible en métro et éclairé en soirée.",
  "Terrain de basket accessible en métro. Assez fréquenté.",
  "Terrain assez fréquenté et partagé avec d'autres sports",
  "Terrain de basket accessible en métro.",
  "Equipement du terrain en très bon état.",
  "Parkings à proximité.",
  "Le terrain est dans un cadre agréable près d'un parc.",
  "2 terrains de basket disponibles sur place."
]

photos = [
  "https://img-3.journaldesfemmes.fr/C9nKor8E8eJvVG0R6i7epVwys-o=/630x/smart/0e71a1c9617a4377965f4c7e09aa1844/ccmcms-jdf/24277980.jpg",
  "https://syntheticexperts.com/wp-content/uploads/rGb1IVlSrSLL55M9KSI6Q.jpg",
  "https://cdn-s-www.leprogres.fr/images/6EAE8CAE-A7ED-402D-BA9E-7AD23536C85B/NW_raw/photo-marie-claude-vasque-1471291394.jpg",
  "https://www.ville.quebec.qc.ca/docs/installationsLoisir/580_basketball-parc-henri-casault-g.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-22657910.jpg",
  "http://thumbs.dreamstime.com/t/public-ext%C3%A9rieur-de-terrain-de-basket-53616883.jpg",
  "https://cdn.paris.fr/paris/2022/06/02/original-d98c80b4635de10f92fcbd14451fc40e.jpg",
  "https://image.freepik.com/photos-gratuite/terrain-football-basketball-exterieur-porte-base-ball-panier-entoure-haute-barriere-protection_127089-1699.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-vide-rue-pour-des-concepts-tels-que-sports-et-l-exercice-le-mode-vie-sain-133306517.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-5597905.jpg",
  "https://www.flexcourtcanada.ca/fr/images/backyard-court-image.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-ext%C3%A9rieur-16961864.jpg",
  "http://www.mairie-revel.fr/wp-content/uploads/2019/04/terrain-basket-1024x575.jpg",
  "https://www.villedemont-tremblant.qc.ca/public_upload/images/nouvelles/thumbnails/iStock-1000542000-1200x630-000000.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-vide-rue-pour-des-concepts-tels-que-sports-et-l-exercice-le-mode-vie-sain-133306517.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-15850437.jpg",
  "https://frenchmorning.com/wp-content/uploads/2020/02/23171-1024x556.jpg",
  "http://www.pres-dici.com/wp-content/uploads/2017/05/IMG_8539a-792ac42ccbb2f022b332005a501e9c08.jpg",
  "https://www.monequipementsport.fr/media/catalog/product/cache/8c03cdee7bd61547753fd4bd98a5851c/d/e/demi-terrain-basket-exterieur-5-x-8-m.jpg",
  "https://i.pinimg.com/originals/14/65/8c/14658c38284761887213ea2faae87a37.jpg",
  "https://www.eps-concept.com/wp-content/uploads/2021/04/AGILIS-NANTES-1.jpg",
  "https://cdn.paris.fr/paris/2022/05/17/original-b3f50de870851c42af271a6c1781543b.jpg",
  "https://thumbs.dreamstime.com/b/terrain-de-basket-vide-rue-pour-des-concepts-tels-que-sports-et-l-exercice-le-lifestyl-sain-116539948.jpg",
  "http://french.sportcourt-surface.com/photo/sportcourt-surface/editor/20180131102403_36827.jpg",
  "https://img.freepik.com/photos-gratuite/mini-terrain-football-basket-ball-exterieur-porte-billes-panier-entoure-haute-barriere-protection_127089-4585.jpg?size=626&ext=jpg",
  "https://syntheticexperts.com/wp-content/uploads/court-tiles-play-768x480.jpg",
  "http://image.made-in-china.com/2f0j10AvitJIDnMCRS/-3X3-terrain-de-basket-carrelage-ext-rieur-de-.jpg",
  "https://st.depositphotos.com/1101052/1324/i/950/depositphotos_13243525-stock-photo-basketball-playground-at-school.jpg",
  "https://www.montpellier.fr/uploads/Image/83/IMF_100/GAB_MPL/35414_578_20200214_123238.jpg",
  "https://www.ligne16.net/wp-content/uploads/2016/07/P7080012.jpg",
  "https://www.alfortville.fr/IMG/jpg/chantereine2.jpg",
  "https://www.guides-sports-loisirs.ca/basketball-exterieur/wp-content/uploads/sites/21/2022/09/basketball-normes-exigences-figure2.png",
  "https://img.freepik.com/photos-gratuite/mini-terrain-football-basket-ball-exterieur-porte-billes-panier-entoure-haute-barriere-protection_127089-5303.jpg?size=626&ext=jpg",
  "https://mairie.villerspol.fr/wp-content/uploads/2020/07/DSC2298_DxO-scaled.jpg"
]

grounds.each do |ground|
  sleep(1)
  playground = Playground.create!(
    name: ground[:name],
    address: ground[:address],
    description: descriptions.sample
  )
  photos_number = (1..4).to_a.sample
  photos_number.times do
    file = URI.open(photos.sample)
    playground.pictures.attach(io: file, filename: "#{playground.name}.jpg", content_type: "photo.jpg")
  end
  puts "#{playground.name} created"
end

puts "Create sessions..."

GAME_TYPE = ['3v3', '5v5', '1v1 Tournament', '4v4', 'Shooting Session']
durations = [30, 45, 60, 90, 120]
comments = [
  "On se retrouve à l'entrée du terrain.",
  "Je propose du covoiturage pour ceux qui sont intéressés.",
  "J'amène un ballon mais si quelqu'un veux en amener un en plus ce serait super!",
  "Je porterai un maillot des Lakers pour que vous puissiez me reconnaitre en arrivant.",
  "Je propose que chacun ramène quelque chose pour un apéro après avoir joué.",
  "Au plaisir de jouer avec vous."
]

100.times do
  creator = User.all.sample
  playground = Playground.all.sample
  date_session = [
    Faker::Date.backward(days: 10),
    Faker::Date.forward(days: 15),
    Faker::Date.forward(days: 15)
  ].sample
  gametype = GAME_TYPE.sample

  case gametype
  when '5v5'
    minimumplayers = 10
  when '4v4'
    minimumplayers = 8
  when '3v3'
    minimumplayers = 6
  else
    minimumplayers = (4..10).to_a.sample
  end

  session = Session.new(
    date: date_session,
    duration: durations.sample,
    game_type: gametype,
    minimum_players: minimumplayers
  )
  session.creator = creator
  session.playground = playground
  session.comment = comments.sample if [true, false, false].sample
  session.save!
  Chatroom.create!(session_id: session.id)
end

puts "Create bookings..."

200.times do
  player = User.all.sample
  session = Session.all.sample
  booking = Booking.new
  booking.session = session
  booking.user = player
  booking.save!
end

puts "Create reviews..."

playground_comments = [
  "Le terrain est petit et il y a souvent du monde, du coup difficile de jouer.",
  "Le terrain est accuillant et c'est agréable d'y jouer",
  "Un peu difficile à trouver...",
  "Terrain bien situé pour ceux qui prennent les transports en commun.",
  "Les panneaux de basket sont abîmés.",
  "Terrain partagé avec d'autres sports, difficile de trouver sa place pour jouer quand il y a du monde.",
  "Super terrain de basket, j'y viens souvent!",
  "Le terrain est juste à coté de la route et avec le passage fréquent de voitures c'est très bruyant.",
  "Terrain calme et peu fréquenté."
]

40.times do
  user = User.all.sample
  playground = Playground.all.sample
  review = Review.new(comment: playground_comments.sample)
  review.user = user
  review.playground = playground
  review.save!
end

puts "Import in database finished"
