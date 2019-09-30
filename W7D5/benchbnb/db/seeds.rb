# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


benchny = Bench.create!(description: "Manhattan bench", lat: 40.7709898, lng: -73.9757365)
benchbk = Bench.create!(description: "Brookln bench", lat: 40.6590823, lng: -73.9682317)
benchsi = Bench.create!(description: "Staten Island bench", lat: 40.5044449, lng: -73.2174999)
benchq = Bench.create!(description: "Queens bench", lat: 40.7429164, lng: -73.8450846)
benchbx = Bench.create!(description: "Bronx bench", lat: 40.8839248, lng: -73.8816458)