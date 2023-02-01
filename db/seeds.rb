# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false)
Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true)
Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false)

Work.create(title: 'Glass Tears', available_for_purchase: false, artist_id: 1)
Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: 1)

Work.create(title: 'California Kiss', available_for_purchase: false, artist_id: 2)
Work.create(title: 'Alabama Southern Charm', available_for_purchase: true, artist_id: 2)

Work.create(title: 'Behind the Gare Saint-Lazare', available_for_purchase: false, artist_id: 3)
Work.create(title: 'Rue Mouffetard', available_for_purchase: true, artist_id: 3)