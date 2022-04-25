# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

SampleProduct.create([
  { id: 123, name: "Ketchup", price: "0.45" },
  { id: 456, name: "Beer", price: "2.33" },
  { id: 879, name: "Õllesnäkk", price: "0.42" },
  { id: 999, name: "75\" OLED TV", price: "1333.37" },
])
