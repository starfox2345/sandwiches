# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sandwich.create([
    {name:"Ham Sandwich", temperature:"Cold", condition:"Good", price:5.00},
    {name:"Cheese Sandwich", temperature:"Cold", condition:"Good", price:2.50},
    {name:"Egg Sandwich", temperature:"Hot", condition:"Fresh", price:3.00}
])