require 'csv'
require "open-uri"

filepath = "storage/exhibitionslist.csv"
csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }

puts "Deleting all"
Artwork.delete_all
ExhibitionAuthor.delete_all
Author.delete_all
ExhibitionType.delete_all
User.delete_all
Type.delete_all
Exhibition.delete_all
Reviews.delete_all

puts "creating user"
user1 = User.create(email: 'axel@gmail.com', password: "1234567")
user1.save!
user2 = User.new(email: 'tristan@gmail.com', password: "1234567")
user2.save!
user3 = User.new(email: 'jean@gmail.com', password: "1234567")
user3.save!

puts "user done"

sculpture = Type.create(name: "sculpture")
painting = Type.create(name: "peinture")
ceramic = Type.create(name: "céramique")
puts "type done"

dantan = Author.create(name: "Jean-Pierre DANTAN")
forest = Author.create(name: "Jean-Baptiste FOREST")
picart = Author.create(name: "Bernard PICART")
puts "author done"

vernet = Artwork.create(title: "Carl Vernet", mouvement: "classique", museum: "Louvre", type: sculpture, author: dantan)
jupiter_and_calisto = Artwork.create(title: "Jupiter et Calisto", mouvement: "mythologique", museum: "Musée Magnin", type: painting, author: forest)
pelerins = Artwork.create(title: "Pèlerins de l'Isle de Cythère", mouvement: "céramique orientale", museum: "Musée de la Compagnie Lorient", type: ceramic, author: picart)
puts "artwork done"



CSV.foreach(filepath, csv_options) do |row|
  Exhibition.create(name: row[2],
                    start_date: row[8],
                    end_date: row[9],
                    museum: row[12],
                    address: row[13],
                    price_expo: row[31] == "payant" ? 0 : 1)
end


expo1 = Exhibition.create(name: "Impréssionistes flammands", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "Louvre", price_expo: 20)
expo2 = Exhibition.create(name: "Qing", start_date: Date.today - 8.days, end_date: Date.today + 30.days, price_expo: 20)
expo3 = Exhibition.create(name: "Céramique", start_date: Date.today - 8.days, end_date: Date.today + 30.days, museum: "Musée de la Compagnie Lorient", price_expo: 50)
puts "exhib done"

exhibitio_auth1 = ExhibitionAuthor.create(author: dantan, exhibition: expo1)
exhibitio_auth2 = ExhibitionAuthor.create(author: forest, exhibition: expo3)
puts "exhibitio_auth done"

exhibitio_Type1 = ExhibitionType.create(type: sculpture, exhibition: expo1)
exhibitio_Type2 = ExhibitionType.create(type: painting, exhibition: expo3)
puts "ExhibitionType done"
