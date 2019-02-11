Player.destroy_all
Game.destroy_all
Round.destroy_all
Tournament.destroy_all
array = []
array << Player.new(first_name: "Matthew", last_name: "Kay", nickname: "person 1", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG5001T1C/img_20190206_135111.jpg")
array << Player.new(first_name: "Shannon", last_name: "Nabors", nickname: "person 2", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG0HW05C1/image_from_ios.jpg")
array << Player.new(first_name: "Artem", last_name: "Mukraineski", nickname: "person 3", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FFZSBG5C5/image_from_ios.jpg")
array << Player.new(first_name: "Andrea", last_name: "Williams", nickname: "person 4", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG3PP8JNR/a.jpg")
array << Player.new(first_name: "Chine", last_name: "Anikwe", nickname: "person 5", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG3EH7PNF/screen_shot_2019-02-11_at_8.59.30_am.png")
array << Player.new(first_name: "James", last_name: "Clement", nickname: "person 6", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG3D45LDS/screen_shot_2019-02-11_at_9.00.47_am.png")
array << Player.new(first_name: "Kyle", last_name: "Houghton", nickname: "Dusty", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FFZG47QP6/image_from_ios.jpg")
array << Player.new(first_name: "Ryan", last_name: "Gill", nickname: "person 8", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG2RM0NRE/screen_shot_2019-02-11_at_9.02.24_am.png")
array << Player.new(first_name: "Benjamin", last_name: "Yellin", nickname: "Ben", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FFZDJK0MP/image_from_ios.jpg")
array << Player.new(first_name: "David Christopher Emory", last_name: "Jones", nickname: "Chris", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG2RN82JC/image_from_ios.png")
array << Player.new(first_name: "Heloise", last_name: "Taillet", nickname: "France", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FFZGC8Q68/image_from_ios.jpg")
array << Player.new(first_name: "Serven", last_name: "Maraghi", nickname: "person 12", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG0NA4N3D/image_from_ios.jpg")
array << Player.new(first_name: "Hai", last_name: "Nguyen", nickname: "Hi!", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG50ZUZ6J/img_20190107_132430.jpg")
array << Player.new(first_name: "Phillip", last_name: "Hartley", nickname: "Phil", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG5111S14/screen_shot_2019-02-11_at_9.08.40_am.png")
array << Player.new(first_name: "Ross", last_name: "Jones", nickname: "The Boss", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FFZHD9ATD/image_from_ios.jpg")
array << Player.new(first_name: "Anthony", last_name: "Gregg", nickname: "The Bully", img_url: "https://flatiron-school.slack.com/files/UF7H2SC4B/FG3Q38XT7/screen_shot_2019-02-11_at_9.10.03_am.png")

array = array.shuffle

cohort = Tournament.create(name: "cohort", num_players: array.size, status: "pending")
round_1= Round.create(num: 1, tournament_id: cohort.id, status: "pending")

array.size.times do

  Game.create(status: "pending", p1: array.shift, p2: array.shift, round_id: round_1.id)

end
