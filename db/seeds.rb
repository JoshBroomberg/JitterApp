# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Profile.delete_all
User.delete_all
Follower.delete_all
Tweet.delete_all

user = User.new
user.email = 'jmb@gmail.com'
user.password = 'password'
user.username = 'jmb'
user.save!

user2 = User.new
user2.email = 'sgl@gmail.com'
user2.password = 'password'
user2.username = 'sgl'
user2.save!

Profile.create!(name: "JoshuaMB", description: "This is JMB's decsription", user: User.first)
Profile.create!(name: "SammyGL", description: "This is SGL's description", user: User.second)

Follower.create!(user: User.first, follower_id: User.second.id)

Tweet.create!(user: User.first, body: "OMG I <3 #CapeTown with @sgl" )
Tweet.create!(user: User.first, body: "Hashtag #YoMama" )
Tweet.create!(user: user2, body: "With @jmb in #CapeTown")
Tweet.create!(user: user2, body: "#YoMama so fat..." )
