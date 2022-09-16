require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seed started"

p "Creating users"
require File.expand_path('db/seeds/seeds_user', Rails.root)

p "Creating categories"
require File.expand_path('db/seeds/seeds_category', Rails.root)

p "Creating motorcycles"
@motorcycles = [
  {
    "articleID": 389572,
    "brand": "Daelim",
    "model": "Altino 125 ES",
    "category_id": 1,
    "year": "2004",
    "image": "http://api-motorcycle.makingdatameaningful.com/files/Daelim/2004/Altino 125 ES/Daelim_2004_Altino 125 ES.jpg",
    "rental_price": 100,
    },
    {
    "articleID": 200985,
    "brand": "Daelim",
    "model": "Daystar 125 FI",
    "category_id": 1,
    "year": "2011",
    "image": "http://api-motorcycle.makingdatameaningful.com/files/Daelim/2011/Daystar 125 FI/Daelim_2011_Daystar 125 FI.jpg",
    "rental_price": 150,
    },
    {
    "articleID": 344347,
    "brand": "Daelim",
    "model": "RoadSport",
    "category_id": 1,
    "year": "2015",
    "image": "http://api-motorcycle.makingdatameaningful.com/files/Daelim/2015/RoadSport/Daelim_2015_RoadSport.jpg",
    "rental_price": 120,
    }
]

@motorcycles.each do |motorcycle|
  Motorcycle.create(motorcycle)
end

p "Creating reservations"
Reservation.create(motorcycle_id: 1, user_id: 1, total_price: 100, start_date: Date.today, end_date: Date.today + 1.day, city: 'Amsterdam')

require File.expand_path('db/seeds/seeds_sports', Rails.root)
require File.expand_path('db/seeds/seeds_scooters', Rails.root)
require File.expand_path('db/seeds/seeds_nakedbikes', Rails.root)
require File.expand_path('db/seeds/seeds_customcruisers', Rails.root)
require File.expand_path('db/seeds/seeds_crossmotocross', Rails.root)
require File.expand_path('db/seeds/seeds_supermotard', Rails.root)
require File.expand_path('db/seeds/seeds_minibikesport', Rails.root)
require File.expand_path('db/seeds/seeds_minibikecross', Rails.root)
require File.expand_path('db/seeds/seeds_classics', Rails.root)


p "------------------"

p "Created #{User.count} users"
p "Created #{Category.count} categories"
p "Created #{Motorcycle.count} motorcycles"
p "Seed finished"