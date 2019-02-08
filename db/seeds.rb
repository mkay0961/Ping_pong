# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all
Game.destroy_all
Round.destroy_all
Tournament.destroy_all

anthony = Player.create(first_name: "Anthony", last_name: "Gregg")
ryan = Player.create(first_name: "Ryan", last_name: "Gill")
andrea = Player.create(first_name: "Andrea", last_name: "Williams")
a = Player.create(first_name: "matthew", last_name: "kay", nickname: "mkay", img_url: "www")
s = Player.create(first_name: "sydney", last_name: "kay", nickname: "skay", img_url: "www")
d = Player.create(first_name: "aaron", last_name: "kay", nickname: "akay", img_url: "www")
f = Player.create(first_name: "fred", last_name: "kay", nickname: "fkay", img_url: "www")
g = Player.create(first_name: "mick", last_name: "kay", nickname: "mkay", img_url: "www")
h = Player.create(first_name: "alex", last_name: "kay", nickname: "alkay", img_url: "www")

tournament = Tournament.create(name: "t1", status: "something")
round = Round.create(num: 1, tournament: tournament, status: "pending")

g1 = Game.create(p1: a, p2: andrea, status: "pending", round: round)
