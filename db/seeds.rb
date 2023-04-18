# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([
  {name: 'Admin', email: 'admin@gmail.com', role: 'admin'}
])

Room.create([
  {name: 'Room 1', description: 'yellow colored room', photo: 'photo.png', city: 'Lagos', price: 500},
  {name: 'Room 2', description: 'white colored room', photo: 'photo.png', city: 'Kwara', price: 230},
  {name: 'Room 3', description: 'green colored room', photo: 'photo.png', city: 'Abuja', price: 1350},
  {name: 'Room 4', description: 'blue colored room', photo: 'photo6.png', city: 'Cairo', price: 450},
  {name: 'Room 5', description: 'black colored room', photo: 'photo5.png', city: 'New York', price: 590},
])
