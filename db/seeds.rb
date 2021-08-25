
require "open-uri"

puts "Deleting all"
Artwork.delete_all
ExhibitionAuthor.delete_all
Author.delete_all
ExhibitionType.delete_all
User.delete_all
Type.delete_all
Exhibition.delete_all
# Reviews.delete_all

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
vangogh = Author.create(name: "Van Gogh")
puts "author done"

vernet = Artwork.create!(title: "Carl Vernet", mouvement: "classique", museum: "Louvre", type: sculpture, author: dantan)
jupiter_and_calisto = Artwork.create!(title: "Jupiter et Calisto", mouvement: "mythologique", museum: "Musée Magnin", type: painting, author: vangogh)
pelerins = Artwork.create!(title: "Pèlerins de l'Isle de Cythère", mouvement: "céramique orientale", museum: "Musée de la Compagnie Lorient", type: ceramic, author: vangogh)
pouet = Artwork.create!(title: "Carl pouet", mouvement: "classique", museum: "lala", type: sculpture, author: dantan)
ero = Artwork.create!(title: "Carl erutrn", mouvement: "classique", museum: "Musée Magnin", type: sculpture, author: forest)
wkgff = Artwork.create!(title: "Carl fdjgn", mouvement: "impressionisme", museum: "lala", type: sculpture, author: vangogh)
has = Artwork.create!(title: "Carl plop", mouvement: "impressionisme", museum: "Musée Magnin", type: sculpture, author: vangogh)
fgnlkndfg = Artwork.create!(title: "Carl plop", mouvement: "epique", museum: "lala", type: sculpture, author: forest)
akngfdngrt = Artwork.create!(title: "Carl plop", mouvement: "classique", museum: "lala", type: sculpture, author: forest)


expo1 = Exhibition.create(name: "Impréssionistes flammands", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "Louvre", price_expo: 20)
expo2 = Exhibition.create(name: "Qing", start_date: Date.today - 8.days, end_date: Date.today + 30.days, price_expo: 20)
expo3 = Exhibition.create(name: "Céramique", start_date: Date.today - 8.days, end_date: Date.today + 30.days, museum: "Musée de la Compagnie Lorient", price_expo: 50)
puts "exhib done"
expo4 = Exhibition.create(name: "Van", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "Louvre", price_expo: 20)
expo5 = Exhibition.create(name: "Van gogh", mouvement: "classique", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "lala", price_expo: 20)
expo5 = Exhibition.create(name: "Impréssionistes flammands", mouvement: "epique", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "Louvre", price_expo: 20)
expo5 = Exhibition.create(name: "Impréssionistes flammands", mouvement: "classique", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "lala", price_expo: 20)
expo5 = Exhibition.create(name: "Impréssionistes flammands", mouvement: "plop", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "lala", price_expo: 20)
expo5 = Exhibition.create(name: "Impréssionistes flammands", mouvement: "epique", start_date: Date.today - 5.days, end_date: Date.today + 10.days, museum: "Louvre", price_expo: 20)


exhibitio_auth1 = ExhibitionAuthor.create(author: dantan, exhibition: expo1)
exhibitio_auth2 = ExhibitionAuthor.create(author: forest, exhibition: expo3)
exhibitio_auth3 = ExhibitionAuthor.create(author: vangogh, exhibition: expo3)
exhibitio_auth4 = ExhibitionAuthor.create(author: vangogh, exhibition: expo4)
exhibitio_auth5 = ExhibitionAuthor.create(author: vangogh, exhibition: expo4)
exhibitio_auth6 = ExhibitionAuthor.create(author: vangogh, exhibition: expo4)
puts "exhibitio_auth done"

exhibitio_Type1 = ExhibitionType.create(type: sculpture, exhibition: expo1)
exhibitio_Type2 = ExhibitionType.create(type: painting, exhibition: expo3)
exhibitio_Type3 = ExhibitionType.create(type: sculpture, exhibition: expo3)
exhibitio_Type3 = ExhibitionType.create(type: painting, exhibition: expo4)
exhibitio_Type4 = ExhibitionType.create(type: painting, exhibition: expo3)
puts "ExhibitionType done"
