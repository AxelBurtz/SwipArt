
require "open-uri"

puts "Deleting all"
Artwork.delete_all
User.delete_all
Exhibition.delete_all

puts "creating user"
user1 = User.create(email: 'axel@wanadoo.com', name: 'Axel', password: "1234567")
user1.save!
user2 = User.new(email: 'tristan@hotmail.com', name: 'Tristan', password: "1234567")
user2.save!
user3 = User.new(email: 'jean@gmail.com', name: 'Jean', password: "1234567")
user3.save!
