# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(username:"Emerald", password:"eme", bio:"A gem.")
user2 = User.create(username:"Wesson", password:"wes", bio:"Also a gem, but not literally.")

tour1 = Tournament.create(user: user1, title:"First", description:"The first tournament in existence.")
tour2 = Tournament.create(user: user1, title:"Second", description:"The second tournament in existence. Not necessarily any better than the First.")
tour3 = Tournament.create(user: user2, title:"Hunting Tournament", description:"Nothing will actually be hunted in this tournament.")
