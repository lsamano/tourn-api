# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

JoinRequest.destroy_all
Membership.destroy_all
Entry.destroy_all
User.destroy_all
Tournament.destroy_all
Team.destroy_all

## Easter Egg Users
puts "Now seeding easter egg users..."
user1 = User.create(username:"Emerald", password:"eme", bio:"A gem.", avatar: "https://robohash.org/gre7z84z6y4era6.jpg?size=300x300&set=set4&bgset=bg2")
user2 = User.create(username:"Fire", password:"hoi", bio:"A strong player, good at everything except taking it easy.", avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2"))
user3 = User.create(username:"Alice", password:"a", bio:"I like hosting tournaments and supporting the community!", avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2"))
user4 = User.create(username:"vKoala", password:"violet", bio:"Am not actually a Koala", avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2"))

user5 = User.create(
  username:"Woodey",
  password:"woo",
  bio: "Member of Zenith.",
  avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2")
)

user6 = User.create(
  username:"Ajae",
  password:"aj",
  bio: "Best Blaster in the West. Catch my streams on Friday nights at 9pm ET!",
  avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2")
)

user7 = User.create(
  username:"G-Ray",
  password:"gray",
  bio: "Artist and Ace of IkaRus.",
  avatar: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set4", "bg2")
)
puts "Easter egg users seeded."

## Easter Egg Tournaments
puts "Now seeding easter egg tournaments..."
tourn1 = Tournament.create(
  host: user1,
  title:"First Cup",
  description:"The first tournament in existence. The symbol of a budding community.",
  start_dt: Faker::Time.forward(60, :evening),
  image: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set2", "bg2")
)
tourn2 = Tournament.create(
  host: user1,
  title:"Second Cup",
  description:"The second tournament in existence. Not necessarily any better than the First.",
  start_dt: Faker::Time.forward(60, :evening),
  image: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set2", "bg2")
)
tourn3 = Tournament.create(
  host: user3,
  title:"House of Horrors",
  description:"The scariest tournament. Come play on the most broken map+mode combinations!",
  start_dt: Faker::Time.forward(60, :evening),
  image: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set2", "bg2")
)
puts "Easter egg tournaments seeded."

## Easter Egg Teams
puts "Now seeding easter egg teams..."
team1 = Team.create(name: "Zenith", captain: user1, tagline:"Peak Performance.", logo: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set1", "bg2"))
team2 = Team.create(name: "IkaRus", captain: user4, tagline:"Ika + Russia", logo: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set1", "bg2"))
puts "Easter eggs teams seeded."

## Users and Teams
puts "Now seeding 32 users and teams..."
32.times do |x|
  username = Faker::Lorem.word.capitalize
  user = User.create(
    username: username,
    password:"aaa",
    bio: Faker::Lorem.sentence,
    avatar: "https://avatars.dicebear.com/v2/gridy/#{username}.svg"
  )
  team = Team.create(
    name: Faker::Lorem.word.capitalize,
    captain_id: user.id,
    tagline: Faker::Lorem.paragraph(2),
    logo: Faker::Avatar.image(Faker::Lorem.characters(15), "300x300", "jpg", "set1", "bg2")
  )
  Membership.create(user: user, team: team, admin: true)
  Membership.create(user: User.all.sample, team: team, admin: false)

  3.times do |member|
    username = Faker::Lorem.word.capitalize
    newMember = User.create(
      username: username,
      password:"aaa",
      bio: Faker::Lorem.sentence,
      avatar: "https://avatars.dicebear.com/v2/bottts/#{username}.svg"
    )
    Membership.create(user: newMember, team: team, admin: false)
  end
end
puts "Users and teams seeded."

## Regular Tournaments
puts "Now seeding 10 regular tournaments with 8 entries each..."
10.times do |tourn|
  hero_name = Faker::Ancient.hero
  tourn = Tournament.create(
    host: user3,
    title: "#{hero_name} Tournament",
    description: Faker::Lorem.paragraph(2),
    start_dt: Faker::Time.forward(60, :evening),
    image: "https://avatars.dicebear.com/v2/bottts/#{hero_name}.svg"
    )
  entrants = Team.all.sample(8)

  entrants.each do |team|
    Entry.create(team: team, tournament: tourn)
  end
end
puts "Tournaments and entries seeded."

## Easter Egg Memberships and Entries
puts "Now seeding easter egg memberships and entries..."
mem1 = Membership.create(user: user2, team: team1, admin: false)
mem2 = Membership.create(user: user1, team: team1, admin: false)
mem3 = Membership.create(user: user4, team: team2, admin: false)
mem4 = Membership.create(user: user4, team: team1, admin: false)
mem5 = Membership.create(user: user5, team: team1, admin: false)
mem6 = Membership.create(user: user6, team: team1, admin: false)
entry1 = Entry.create(team: team1, tournament: tourn3)
puts "Easter egg memberships and entries seeded."

puts "Seeding complete."
