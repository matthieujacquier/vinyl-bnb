# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

puts "cleaning the database"
Listing.destroy_all
User.destroy_all

# Booking.destroy_all
# Review.destroy_all


puts "Creating users"

user1 = User.create(
  email: "sam@example.com",
  password: "password123",
  first_name: "Sam",
  last_name: "Techno",
  city: "Cologne",
  bio: "Techno enthusiast and casual terasse smoker."
)

user2 = User.create(
  email: "marta@example.com",
  password: "password123",
  first_name: "Marta",
  last_name: "Rock",
  city: "Warshaw",
  bio: "Rock enthusiast and cat owner."
)

user3 = User.create(
  email: "pelin@example.com",
  password: "password123",
  first_name: "Pelin",
  last_name: "Jazz",
  city: "Berlin",
  bio: "Jazz enthusiast and album collector."
)

user4 = User.create(
  email: "sneha@example.com",
  password: "password123",
  first_name: "Sneha",
  last_name: "Reggae",
  city: "Amsterdam",
  bio: "Jazz enthusiast and album listener."
)

user5 = User.create(
  email: "matthieu@example.com",
  password: "password123",
  first_name: "Matthieu",
  last_name: "Rap",
  city: "Brussels"
)

puts "Created #{User.count} users"

puts "Creating the listings"

listing1 = Listing.create(
  album_name: "Dark Side of the Moon",
  artist_name: "Pink Floyd",
  tracklist: "1. Speak to Me\n2. Breathe\n3. On the Run\n4. Time",
  description: "Iconic progressive rock album released in 1973.",
  genre: "Progressive Rock",
  youtube_url: "https://www.youtube.com/watch?v=2o4ygOv0wKk&list=PL3PhWT10BW3Urh8ZXXpuU9h526ChwgWKy&ab_channel=PinkFloyd-Topic",
  price_per_day: 4.99,
  active: true,
  user: user1
)

listing2 = Listing.create(
  album_name: "Thriller",
  artist_name: "Michael Jackson",
  tracklist: "1. Wanna Be Startin' Somethin'\n2. Thriller\n3. Beat It\n4. Billie Jean",
  description: "Best-selling album of all time, blending pop, rock, and funk.",
  genre: "Pop",
  youtube_url: "https://www.youtube.com/watch?v=sOnqjkJTMaA&ab_channel=michaeljacksonVEVO",
  price_per_day: 5.50,
  active: true,
  user: user1
)

listing3 = Listing.create(
  album_name: "Abbey Road",
  artist_name: "The Beatles",
  tracklist: "1. Come Together\n2. Something\n3. Here Comes the Sun\n4. Octopus's Garden",
  description: "The Beatles’ eleventh studio album featuring iconic melodies.",
  genre: "Rock",
  youtube_url: "https://www.youtube.com/watch?v=oolpPmuK2I8&list=PLycVTiaj8OI-kwvNjgvvopMJt__x-y5mD&ab_channel=TheBeatles-Topic",
  price_per_day: 4.75,
  active: true,
  user: user1
)

listing4 = Listing.create(
  album_name: "Back to Black",
  artist_name: "Amy Winehouse",
  tracklist: "1. Rehab\n2. You Know I'm No Good\n3. Back to Black\n4. Love Is a Losing Game",
  description: "Critically acclaimed soul album with vintage vibes and raw emotion.",
  genre: "Soul",
  youtube_url: "https://www.youtube.com/watch?v=TJAfLE39ZZ8&ab_channel=AmyWinehouseVEVO",
  price_per_day: 4.25,
  active: true,
  user: user2
)

listing5 = Listing.create(
  album_name: "Random Access Memories",
  artist_name: "Daft Punk",
  tracklist: "1. Give Life Back to Music\n2. Get Lucky\n3. Lose Yourself to Dance\n4. Contact",
  description: "Grammy-winning electronic album with disco and funk influence.",
  genre: "Electronic",
  youtube_url: "https://www.youtube.com/watch?v=wIMSU8otS-g&ab_channel=OscarCanto",
  price_per_day: 4.95,
  active: true,
  user: user2
)

listing6 = Listing.create(
  album_name: "To Pimp a Butterfly",
  artist_name: "Kendrick Lamar",
  tracklist: "1. Wesley's Theory\n2. King Kunta\n3. Alright\n4. The Blacker the Berry",
  description: "Influential hip-hop album known for its jazz fusion and political depth.",
  genre: "Hip-Hop",
  youtube_url: "https://www.youtube.com/watch?v=l9fN-8NjrvI&list=PL8YH4mOwWryUO4kxV36tPqkiaAr4_oJe5",
  price_per_day: 5.00,
  active: true,
  user: user2
)

listing7 = Listing.create(
  album_name: "Rumours",
  artist_name: "Fleetwood Mac",
  tracklist: "1. Dreams\n2. Go Your Own Way\n3. The Chain\n4. Don't Stop",
  description: "Timeless rock album filled with emotion and harmony.",
  genre: "Classic Rock",
  youtube_url: "https://www.youtube.com/watch?v=-uFU79MGj00&pp=ygUVcnVtb3VycyBmbGVldHdvb2QgbWFj",
  price_per_day: 4.60,
  active: true,
  user: user2
)

listing8 = Listing.create(
  album_name: "1989",
  artist_name: "Taylor Swift",
  tracklist: "1. Blank Space\n2. Style\n3. Shake It Off\n4. Out of the Woods",
  description: "Grammy-winning pop album that marked a stylistic reinvention.",
  genre: "Pop",
  youtube_url: "https://www.youtube.com/watch?v=0BYUf8QDCZU&list=PLxA687tYuMWiHaLuwtNz6edZMBBgrXTL_&ab_channel=TaylorSwift-Topic",
  price_per_day: 4.30,
  active: true,
  user: user3
)

listing9 = Listing.create(
  album_name: "OK Computer",
  artist_name: "Radiohead",
  tracklist: "1. Airbag\n2. Paranoid Android\n3. Karma Police\n4. No Surprises",
  description: "Seminal alt-rock album with dystopian themes and experimental sound.",
  genre: "Alternative Rock",
  youtube_url: "https://www.youtube.com/watch?v=jNY_wLukVW0&list=PLxzSZG7g8c8x6GYz_FcNr-3zPQ7npP6WF&ab_channel=Radiohead-Topic",
  price_per_day: 4.80,
  active: true,
  user: user3
)

listing10 = Listing.create(
  album_name: "Straight Outta Compton",
  artist_name: "N.W.A",
  tracklist: "1. Straight Outta Compton\n2. **** tha Police\n3. Gangsta Gangsta\n4. Express Yourself",
  description: "Groundbreaking West Coast hip-hop album that shaped the genre with its raw social commentary.",
  genre: "Hip-Hop",
  youtube_url: "https://www.youtube.com/watch?v=TMZi25Pq3T8&pp=ygUabndhIHN0cmFpZ2h0IG91dHRhIGNvbXB0b27SBwkJsQkBhyohjO8%3D",
  price_per_day: 4.70,
  active: true,
  user: user3
)

puts "Created #{Listing.count} listings"

puts "adding the Album covers"

listing1.photo.attach(
  io: URI.open("https://i.discogs.com/f9HxltpumjQpZlcBXQzxXvurnEmyeJBM-nby8zXfXNo/rs:fit/g:sm/q:90/h:600/w:590/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTE4NzMw/MTMtMTcyNzc2NDkx/OS04NTI3LmpwZWc.jpeg"),
  filename: "dark_side_of_the_moon.jpg",
  content_type: "image/jpeg"
)

listing2.photo.attach(
  io: URI.open("https://i.discogs.com/dWe2AyguSxJpaaEWbK_mVLL3zs2ejuta0sJCx5BvS8o/rs:fit/g:sm/q:90/h:600/w:597/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI5MTEy/OTMtMTU5NDI0NTgx/Mi03OTMxLmpwZWc.jpeg"),
  filename: "thriller.jpg",
  content_type: "image/jpeg"
)

listing3.photo.attach(
  io: URI.open("https://i.discogs.com/M2yc5OJZPdVoDm2_UlRRXuDlDguamLLSdnbziNmZoQI/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTI2MDc0/MjQtMTYzMDYwMTA4/Ny0xMTk5LmpwZWc.jpeg"),
  filename: "abbey_road.jpg",
  content_type: "image/jpeg"
)

listing4.photo.attach(
  io: URI.open("https://i.discogs.com/syRCX8NaLwK2SMk8X6TVU_DWc8RRqE4b-tebAQ6kVH4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTgyNTQz/OC0xNjE3ODE0NDI2/LTU1MjUuanBlZw.jpeg"),
  filename: "back_to_black.jpg",
  content_type: "image/jpeg"
)

listing5.photo.attach(
  io: URI.open("https://i.discogs.com/zFVZE4s0zSXUIM7OMl2UDckSq0zlopdHBHRz23zqMJk/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ1NzAz/NjYtMTUzOTI5NTA5/Mi02MDg3LnBuZw.jpeg"),
  filename: "random_access_memories.jpg",
  content_type: "image/jpeg"
)

listing6.photo.attach(
  io: URI.open("https://i.discogs.com/8ZD7MZypmyxuliTV-Czyy03rA9ou2E-BL2rhIFTLUlk/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTY3ODEy/ODYtMTU4NjA5MTU4/OC04ODQ5LmpwZWc.jpeg"),
  filename: "to_pimp_a_butterfly.jpg",
  content_type: "image/jpeg"
)

listing7.photo.attach(
  io: URI.open("https://i.discogs.com/X2kgbJ7rhk0HNH39Nep8tTD_Fly6pmHk2KR_Lptjk88/rs:fit/g:sm/q:90/h:599/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTUyNjM1/MS0xMjkyMjkzNjg1/LmpwZWc.jpeg"),
  filename: "rumours.jpg",
  content_type: "image/jpeg"
)

listing8.photo.attach(
  io: URI.open("https://i.discogs.com/P5sv32IczQ5xAgjvQusxAru1ddYWDMIXx_H9lDRRPDs/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTcwODk2/NjktMTQ1OTU4MzY2/MS0xMjk1LmpwZWc.jpeg"),
  filename: "1989.jpg",
  content_type: "image/jpeg"
)

listing9.photo.attach(
  io: URI.open("https://i.discogs.com/F_KSyKjGi2YN5SBttMhdgP2zyNdmHv7HHWvDVGj3Shg/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTQ5NTA3/OTgtMTM4ODYyMzYx/MS0yMzYyLmpwZWc.jpeg"),
  filename: "ok_computer.jpg",
  content_type: "image/jpeg"
)

listing10.photo.attach(
  io: URI.open("https://i.discogs.com/ZgTTXLi35oQJzIdZyLtgbW9nOHpwsAOv9GytSSR9gM4/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTEwMzY0/OC0xNjQyNDEyODMy/LTU0ODAuanBlZw.jpeg"),
  filename: "straight_outta_compton.jpg",
  content_type: "image/jpeg"
)
