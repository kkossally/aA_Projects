# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


a = Artwork.create!(artist_id: User.second.id, title: 'Landscape in Blue', image_url: 'https://mymodernmet.com/landscape-paintings-americas-wine-regions-erin-hanson/')
b = Artwork.create!(artist_id: User.first.id, title: 'Points', image_url: 'https://www.metmuseum.org/toah/works-of-art/57.181/')
