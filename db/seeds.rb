#create users

josh = User.create(name: "Josh", email: "josh@josh.com", password: "password")
katelyn = User.create(name: "Katelyn", email: "katelyn@katelyn.com", password: "password")

#create games

Game.create(title: "Super Mario", genre: "platform", system: "Super Nintendo", dev_company: "Nintendo EAD", release_year: "1985", user_id: josh.id)
Game.create(title: "Halo", genre: "fps", system: "Xbox", dev_company: "Bungie", release_year: "2001", user_id: josh.id)
Game.create(title: "Mario Kart 64", genre: "racing", system: "Nintendo 64", dev_company: "Nintendo EAD", release_year: "1996", user_id: katelyn.id)