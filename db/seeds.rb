require "open-uri"
require 'faker'

puts "Creating some caiçaras 🌊"

nezinho = {
  local: true,
  first_name: 'Nezinho',
  email: 'nezinho@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'The official storyteller of the beach, Nezinho is a celebrity on the
  island, a minstrel of the local Culture that loves sharing tales and stories.'
}

neneca = {
  local: true,
  first_name: 'Neneca',
  email: 'neneca@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Friendly and hard working, Neneca is an amazing cook, famously known for her
  delicious meal and special beans. She is an entrepeneur that has been investing
  in the family bussiness for decades.'
}

verte = {
  local: true,
  first_name: 'Verte',
  email: 'verte@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Zuleica and Verte can be found on the bamboo beach bar, offering all types
  of meals. Zuleica is a talented craftworker and Verte is an excellent sailor, who
  knows all about the sea.'
}

ferreira = {
  local: true,
  first_name: 'Ferreira',
  email: 'ferreira@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Ferreira likes interesting conversations under the moonlight, he is known for gathering friends at his bar, one of the main meeting points at the beach. He is also an experienced sailor.'
}

larissa = {
  local: true,
  first_name: 'Larissa',
  email: 'larissa@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'An adventurer spirit, Larissa left the city with her husband to live a caiçara life. They have a deep concern on protecting nature and love to motivate tourists to recycle materials and reuse containers.'
}

ita = {
  local: true,
  first_name: 'Ita',
  email: 'ita@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Nice and communcative, Ita is that cool person everyone wants to stop and chat with. He is an attentive host that loves having people over for live music night and long conversations under the starry sky.'
}

luis = {
  local: true,
  first_name: 'Luis',
  email: 'luis@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Luis is all about parties, hosting young people and surfers. He and his children love talking about the waves and will happily teach you all about the best spots to surf on the island.'
}

roseno = {
  local: true,
  first_name: 'Roseno',
  email: 'roseno@amav.com',
  password: '123456',
  phone_number: '24 998899-9988',
  address: 'Aventureiro',
  bio: 'Senhor Roseno knows all about Ilha Grande and has some incredible stories to share. He loves dancing and hosting forró pé de serra nights and is always inventing new ways to please guests. He is also a talented sailor.'
}

caicaras = [nezinho, neneca, verte, ferreira, larissa, ita, luis, roseno]

profile_photos = {
  nezinho: "https://res.cloudinary.com/juliaf1/image/upload/v1607696494/nezinho_wcvkas.png",
  neneca: "https://res.cloudinary.com/juliaf1/image/upload/v1607696493/neneca_zrpxqv.png",
  verte: "https://res.cloudinary.com/juliaf1/image/upload/v1607696496/verte_ef5wnf.png",
  ferreira: "https://res.cloudinary.com/juliaf1/image/upload/v1607696492/ferreira_co2b3d.png",
  larissa: "https://res.cloudinary.com/juliaf1/image/upload/v1607696491/larissa_smwnrh.png",
  ita: "https://res.cloudinary.com/juliaf1/image/upload/v1607696491/ita_jtazqv.png",
  luis: "https://res.cloudinary.com/juliaf1/image/upload/v1607696492/luis_kdbdtd.png",
  roseno: "https://res.cloudinary.com/juliaf1/image/upload/v1607696493/roseno_p1ktgj.png"
}

caicaras.each do |caicara|
  User.create(caicara)
  puts "Created #{caicara[:first_name]}"
  local = User.last
  file = URI.open(profile_photos[local.first_name.downcase.to_sym])
  local.photo.attach(io: file, filename: "#{local.first_name.downcase}.jpg", content_type: 'image/jpg')
  if local.photo
    puts "#{local.first_name}'s profile photo attached! 📷"
  end
end

puts "Creating some boats ⛵"

sailor_verte = User.find_by(first_name: 'Verte')
sailor_ferreira = User.find_by(first_name: 'Ferreira')
sailor_roseno = User.find_by(first_name: 'Roseno')
sailor_luis = User.find_by(first_name: 'Luis')

nezinho = User.find_by(first_name: 'Nezinho')
neneca = User.find_by(first_name: 'Neneca')
larissa = User.find_by(first_name: 'Larissa')
ita = User.find_by(first_name: 'Ita')

verte_boat = {
  name: 'Amanda IV',
  max_occupation: '18',
  user_id: sailor_verte.id
}

ferreira_boat = {
  name: 'Chega Mais',
  max_occupation: '15',
  user_id: sailor_ferreira.id
}

roseno_boat = {
  name: 'Novo Milênio',
  max_occupation: '20',
  user_id: sailor_roseno.id
}

luis_boat = {
  name: 'Rei Mateus',
  max_occupation: '12',
  user_id: sailor_luis.id
}

boats = [verte_boat, ferreira_boat, roseno_boat, luis_boat]

boats.each do |boat|
  Boat.create(boat)
  puts "Created #{boat[:name]}"
end

puts "Adding photos to boats 📷"
file = URI.open("https://res.cloudinary.com/juliaf1/image/upload/v1607697397/3-amanda_zb7ycx.png")
barco1 = Boat.find(1)
barco1.photo.attach(io: file, filename: "#{barco1.name}.jpg", content_type: 'image/jpg')

file = URI.open("https://res.cloudinary.com/juliaf1/image/upload/v1607697395/1-chegamais_zs9pxz.png")
barco2 = Boat.find(2)
barco2.photo.attach(io: file, filename: "#{barco2.name}.jpg", content_type: 'image/jpg')

file = URI.open("https://res.cloudinary.com/juliaf1/image/upload/v1607697398/4-milenio_cmmtht.png")
barco3 = Boat.find(3)
barco3.photo.attach(io: file, filename: "#{barco3.name}.jpg", content_type: 'image/jpg')

file = URI.open("https://res.cloudinary.com/juliaf1/image/upload/v1607697403/2-reimateus_mjnd1g.png")
barco4 = Boat.find(4)
barco4.photo.attach(io: file, filename: "#{barco4.name}.jpg", content_type: 'image/jpg')

puts "Creating some boat journeys ⛵"

n = 0
20.times do
  BoatJourney.create(
    boat_id: Boat.find(1).id,
    departure_time: Time.new(2020,12,12,8,30) + n.day,
    travel_duration: '40 min',
    price_person: '90'
  )
  n += 1
end

n = 0
20.times do
  BoatJourney.create(
    boat_id: Boat.find(2).id,
    departure_time: Time.new(2020,12,12,5,30) + n.day,
    travel_duration: '2 hours',
    price_person: '70'
  )
  n += 1
end

n = 0
20.times do
  BoatJourney.create(
    boat_id: Boat.find(3).id,
    departure_time: Time.new(2020,12,12,12,00) + n.day,
    travel_duration: '1h 40min',
    price_person: '70'
  )
  n += 1
end

20.times do
  BoatJourney.create(
    boat_id: Boat.find(4).id,
    departure_time: Time.new(2020,11,12,15,00) + n.day,
    travel_duration: '2 hours',
    price_person: '70'
  )
  n += 1
end

puts "#{BoatJourney.count} boat journeys created"

puts "Creating some campsites ⛺"

camping_nezinho = {
  user_id: nezinho.id,
  name: 'Camping do Nezinho',
  description: "Nezinho’s camping is the first one to be seen after the arrival in the island.
  It is located next to the AMAV’s cabin. And due to its position, campers do not have to carry
  their luggage along the beach. Nezinho’s camp is noteworthy for the privacy between tents
  and for its atmosphere of tranquility. His camp also offers a kitchen to the campers.",
  daily_price: 30,
  availability: 'We have open spots.'
}

camping_neneca = {
  user_id: neneca.id,
  name: 'Camping da Neneca',
  description: "Neneca’s Camping has a bar called O Meninno da Canoa. This bar is a tribute paid
  by her husband Sidnei to their youngster son, Cauã. It is worthy saying that Sidnei is a local
  craftsman who builds boats. In addition to the bar, Neneca rents rooms and vacancies in her
  camping site located on seafront.",
  daily_price: 30,
  availability: 'We are full on New Years.'
}

camping_verte = {
  user_id: sailor_verte.id,
  name: 'Camping do Verte',
  description: "Verte’s camping has an area that attends a great demand of visitors.
  Verte and Zuleica also have a bar whose frame is made in bamboo. The couple serves visitors
  well and friendship by telling tourists old stories about Aventureiro and about Ilha Grande.
  Their bar supplies all meals buffet service, from morning coffee until dinner, not to mention the snacks.",
  daily_price: 30,
  availability: 'We have open spots.'
}

camping_ferreira = {
  user_id: sailor_ferreira.id,
  name: 'Camping do Ferreira',
  description: "Ferreira’s camping is located near the beach before Igrejinha.
  It is right in the middle of the beach for the ones who arrive by boat.
  This camp has a beautiful bar which offers a variety of meals and beverages.
  Besides the camping, Ferreira offers rooms with beds, bed clothes, towels and toilet.
  His bar is a meeting point for chats.",
  daily_price: 30,
  availability: 'We are full on New Years.'
}

camping_larissa = {
  user_id: larissa.id,
  name: 'Camping da Larissa',
  description: "Larissa’s camping, located behind the church, first hosted Larissa’s surfer friends from São Paulo.
  Nowadays, it is frequented by tourists from different places and families who want to enjoy the familiar
  atmosphere of it. the ideal place for small groups and families.",
  daily_price: 40,
  availability: 'We are full on New Years.'
}

camping_ita = {
  user_id: ita.id,
  name: 'Camping do Ita',
  description: "Located by the end of the sand strip in front of the sea, Ita's camping
  is a central spot on the beach. It has a bar where you can find meals and beverages.
  All dishes are delicious and made by Leonice, Ita’s wife, an experienced cook.
  The camp is next to his father’s, Roseno’s. It is another meeting point for long-lasting chats at night.",
  daily_price: 45,
  availability: 'We have open spots.'
}

camping_roseno = {
  user_id: sailor_roseno.id,
  name: 'Camping do Roseno',
  description: "Pleasent camping located on the sand, it's a familiar place to stay with friends
  and family. The bar serves delicious meals and beverages, besides hosting forró at night.",
  daily_price: 40,
  availability: 'We have open spots.'
}

camping_luis = {
  user_id: sailor_luis.id,
  name: 'Camping do Luís',
  description: "One of the best known spots of Aventureiro. Youthfully decorated and connected
  to the surf universe, it is the camp for the ones who likes to have fun with friends.
  Colorful lights are also part of the decoration at night, when they promote parties for its visitors.
  Besides the wonderful view to the sea, the camping has an all meal buffet service including snacks.",
  daily_price: 80,
  availability: 'We are full on New Years.'
}

camping_sites = [camping_nezinho, camping_neneca, camping_verte, camping_ferreira, camping_larissa, camping_ita, camping_roseno, camping_luis]

campsite_photos = {
  camping_nezinho: "https://res.cloudinary.com/juliaf1/image/upload/v1606932034/ycxx87zzjbr6m92pozx2quvu9lm2.jpg",
  camping_neneca: "https://res.cloudinary.com/juliaf1/image/upload/v1606932375/kbsk9hjcnldmrdy14652xi91bbbd.jpg",
  camping_verte: "https://res.cloudinary.com/juliaf1/image/upload/v1606932401/rqjdlf4r5t94zq7z7hqy2tl027ny.jpg",
  camping_ferreira: "https://res.cloudinary.com/juliaf1/image/upload/v1606932131/53tdpvu66pxyc8cvzmzj6l8c8v3y.jpg",
  camping_larissa: "https://res.cloudinary.com/juliaf1/image/upload/v1606932100/knj9g2p1yhi7pldjak08zm0n66fe.jpg",
  camping_ita: "https://res.cloudinary.com/juliaf1/image/upload/v1606932653/5raifuilbyhp9lmjr87cguqz7ipm.jpg",
  camping_roseno: "https://res.cloudinary.com/juliaf1/image/upload/v1606932599/e8efs5ag9drpcq7ro4s0y43ykbf2.jpg",
  camping_luis: "https://res.cloudinary.com/juliaf1/image/upload/v1606932345/b6bnh6wwqsklshhh44sd81ivgvad.jpg"
}

camping_sites.each do |camping|
  Campsite.create(camping)
  puts "Created #{camping[:name]}"
  campsite = Campsite.last
  file = URI.open(campsite_photos["camping_#{campsite.user.first_name.downcase}".to_sym])
  campsite.photo.attach(io: file, filename: "#{campsite.user.first_name.downcase}.jpg", content_type: 'image/jpg')
  if campsite.photo
    puts "#{campsite.name} photo attached! 📷"
  end
end

puts "Creating travellers"

rowan = {
  local: false,
  admin: false,
  first_name: 'Rowan',
  email: 'rowan@lewagon.com',
  password: 'lewagon499',
  phone_number: '44 788474798',
  address: 'London',
  bio: "Life long explorer!"
}

julia = {
  local: false,
  admin: true,
  first_name: 'Julia',
  email: 'julia@lewagon.com',
  password: 'lewagon499',
  phone_number: '55 999999999',
  address: 'São Paulo',
  bio: "Aventura and Sossego 🌊"
}

tomas = {
  local: false,
  admin: true,
  first_name: 'Tomas',
  email: 'tomas@lewagon.com',
  password: 'lewagon499',
  phone_number: '55 999999999',
  address: 'Rio de Janeiro',
  bio: "Dog lover, adventure enthusiast!"
}

travellers = [rowan, julia, tomas]

travellers.each do |traveller|
  User.create(traveller)
  puts "Created #{traveller[:first_name]}"
end

puts "Creating some fake travellers"

10.times do
  User.create(
  local: false,
  first_name: ['Pedro', 'Amanda', 'Luisa', 'Sabrina', 'Guilherme', 'Lucas'].sample,
  email: "#{:first_name}#{[1, 2, 3, 4, 5].sample}@gmail.com",
  password: '123456',
  phone_number: Faker::PhoneNumber.cell_phone_in_e164,
  address: Faker::Address.city,
  bio: Faker::Movies::StarWars.quote
  )
end

puts "Making some boat journey reservations"

travellers = User.last(12)
travellers.each do |traveller|
  5.times do
    bt_journey = BoatJourney.where('departure_time > ?', DateTime.now).sample
    num_passengers = rand(1..4)
    BoatJourneyReservation.create(
      user_id: traveller.id,
      boat_journey_id: bt_journey.id,
      number_passengers: num_passengers,
      total_price: bt_journey.price_person * num_passengers,
      status: 0
    )
  end
end

if BoatJourneyReservation.present?
  puts "Boat journey reservations created"
else
  puts "DID NOT WORK"
end

puts "Creating feed"

new_feed = Feed.create

puts "Seeding complete!"
