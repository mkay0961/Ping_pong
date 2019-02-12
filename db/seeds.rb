Player.destroy_all
Game.destroy_all
Round.destroy_all
Tournament.destroy_all

User.create(username: "mkay", password: "hello")

array = []

array << Player.create(first_name: "Matthew", last_name: "Kay", nickname: "The Creator", img_url: "matthew.jpg")
array << Player.create(first_name: "Shannon", last_name: "Nabors", nickname: "The Teacher", img_url: "shannon.jpg")
array << Player.create(first_name: "Artem", last_name: "Mukraineski", nickname: "Mr. Evil", img_url: "Image from iOS (3).jpg")
array << Player.create(first_name: "Andrea", last_name: "Williams", nickname: "The Spooker", img_url: "a.jpg")
array << Player.create(first_name: "Chinenye", last_name: "Anikwe", nickname: "Chine", img_url: "chine.png")
array << Player.create(first_name: "James", last_name: "Clement", nickname: "Gains", img_url: "james.png")
array << Player.create(first_name: "Kyle", last_name: "Houghton", nickname: "Dusty", img_url: "kyle.jpg")
array << Player.create(first_name: "Ryan", last_name: "Gill", nickname: "Chinchilla", img_url: "ryan.png")
array << Player.create(first_name: "Benjamin", last_name: "Yellin", nickname: "Ben", img_url: "ben.jpg")
array << Player.create(first_name: "David Christopher Emory", last_name: "Jones", nickname: "Chris", img_url: "chris.png")
array << Player.create(first_name: "Heloise", last_name: "Taillet", nickname: "France", img_url: "heloise.jpg")
array << Player.create(first_name: "Serven", last_name: "Maraghi", nickname: "Human Rightsinator", img_url: "serven.jpg")
array << Player.create(first_name: "Hai", last_name: "Nguyen", nickname: "Hi!", img_url: "hai.jpg")
array << Player.create(first_name: "Phillip", last_name: "Hartley", nickname: "Phil", img_url: "phil.png")
array << Player.create(first_name: "Ross", last_name: "Jones", nickname: "The Boss", img_url: "ross.jpg")
array << Player.create(first_name: "Anthony", last_name: "Gregg", nickname: "The Bully", img_url: "anthony.png")

array = array.shuffle

cohort = Tournament.create(name: "cohort", num_players: array.size, status: "pending")
round_1= Round.create(num: 1, tournament_id: cohort.id, status: "pending")

games = array.size / 2

games.times do

  Game.create(status: "pending", p1: array.shift, p2: array.shift, round_id: round_1.id)

end

4.times do |i|

  array1 = []

  16.times do

    array1 << Player.create(
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.unique.last_name,
      nickname: Faker::Name.unique.middle_name,
      img_url: Faker::Company.unique.buzzword)
    end



  array1 = array1.shuffle

  cohort1 = Tournament.create(name: "cohort" +i.to_s, num_players: array1.size, status: "pending")
  round_11= Round.create(num: 1, tournament_id: cohort1.id, status: "pending")

  games1 = array1.size / 2

  games1.times do

    Game.create(status: "pending", p1: array1.shift, p2: array1.shift, round_id: round_11.id)

  end

end
