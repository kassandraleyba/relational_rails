# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Work.destroy_all
Artist.destroy_all

artist_1 = Artist.create(name: 'Man Ray', city: 'Philadelphia', alive_today: false, created_at: Time.now - 1.hour)
artist_2 = Artist.create(name: 'Elliott Erwitt', city: 'Paris', alive_today: true, created_at: Time.now - 2.hour)
artist_3 = Artist.create(name: 'Henri Cartier Bresson', city: 'Chanteloup-en-Brie', alive_today: false)

work_1 = Work.create(title: 'Glass Tears', available_for_purchase: false, artist_id: artist_1.id)
work_2 = Work.create(title: 'Violon dIngres', available_for_purchase: false, artist_id: artist_1.id)

work_3 = Work.create(title: 'California Kiss', available_for_purchase: false, artist_id: artist_2.id)
work_4 = Work.create(title: 'Alabama Southern Charm', available_for_purchase: true, artist_id: artist_2.id)

work_5 = Work.create(title: 'Behind the Gare Saint-Lazare', available_for_purchase: false, artist_id: artist_3.id)
work_6 = Work.create(title: 'Rue Mouffetard', available_for_purchase: true, artist_id: artist_3.id)