# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Tournament.destroy_all
Team.destroy_all
Membership.destroy_all
Entry.destroy_all

user1 = User.create(username:"Emerald", password:"eme", bio:"A gem.")
user2 = User.create(username:"Fire", password:"hoi", bio:"A strong player, good at everything except taking it easy.")
user3 = User.create(username:"Alice", password:"a", bio:"I like hosting tournaments and supporting the community!")
user4 = User.create(username:"vKoala", password:"violet", bio:"Am not actually a Koala")

tourn1 = Tournament.create(
  host: user1,
  title:"First Cup",
  description:"The first tournament in existence. The symbol of a budding community.",
  start_dt: "2019-04-12 [15:00:00]"
)
tourn2 = Tournament.create(
  host: user1,
  title:"Second Cup",
  description:"The second tournament in existence. Not necessarily any better than the First.",
  start_dt: "2019-04-19 [15:00:00]"
)
tourn3 = Tournament.create(
  host: user3,
  title:"House of Horrors",
  description:"The scariest tournament. Come play on the most broken map+mode combinations!",
  start_dt: "2019-03-20 [13:00:00]"
)

team1 = Team.create(name: "Zenith", captain: user1, tagline:"Peak Performance.")
team2 = Team.create(name: "IkaRus", captain: user4, tagline:"Ika + Russia")

mem1 = Membership.create(user: user2, team: team1)
mem2 = Membership.create(user: user1, team: team1)
mem3 = Membership.create(user: user4, team: team2)
mem4 = Membership.create(user: user4, team: team1)

entry1 = Entry.create(team: team1, tournament: tourn3)
