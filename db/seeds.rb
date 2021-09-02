require 'csv'
require "open-uri"

filepath_exhib = "exhib-clean.csv"
filepath_artworks = "artworks-ordered.csv"
filepath_exhib_nn = "exhib-nn-new.csv"

# puts "Deleting all"
# Artwork.delete_all
# ExhibitionAuthor.delete_all
# Author.delete_all
# ExhibitionType.delete_all
# UserExhibition.delete_all
# Review.delete_all
# Type.delete_all
# Exhibition.delete_all
# User.delete_all

# csv_options = { col_sep: ';', headers: :first_row, encoding: 'iso-8859-1:utf-8' }
# puts "creating user"
# user1 = User.create(email: 'axel@gmail.com', password: "1234567")
# user1.save!
# user2 = User.new(email: 'tristan@gmail.com', password: "1234567")
# user2.save!
# user3 = User.new(email: 'jean@gmail.com', password: "1234567")
# user3.save!
# user4 = User.create(email: 'demo@gmail.com', password: "1234567")
# user4.save!
# user5 = User.new(email: 'test@gmail.com', password: "1234567")
# user5.save!
# user6 = User.new(email: 'test1@gmail.com', password: "1234567")
# user6.save!
# user5 = User.new(email: 'test2@gmail.com', password: "1234567")
# user5.save!
# user6 = User.new(email: 'test3@gmail.com', password: "1234567")
# user6.save!

# URL;Titre;Chapeau;Mouvement;Date de début;Date de fin;
# Nom du lieu;Adresse du lieu;Code postal;Ville;Coordonnées géographiques;
# Accès PMR;Accès mal voyant;Accès mal entendant;Transport;Nom de contact;Téléphone de contact;
# Email de contact;Type d'accès;URL de réservation;Téléphone de réservation;Email de réservation;
# Type de prix;Détail du prix;Image de couverture;URL de l'image;

# CSV.foreach(filepath_exhib, { col_sep: ';', headers: :first_row, encoding: "UTF-8" }) do |row|
#   image = FastImage.size(row[24])
#   if !image || (image[0] || image[1]) > 2800
#     puts "image is too big"
#   else
#     new_exhib = Exhibition.create(name: row[1],
#                       start_date: row[4],
#                       end_date: row[5],
#                       museum: row[6],
#                       address: row[7],
#                       price_expo: row[22],
#                       mouvement: row[3])
#     file = URI.open(row[24])
#     new_exhib.photo.attach(io: file, filename: row[1], content_type: 'image/jpg')
#   end
# end

# csv_options = { col_sep: ';', headers: :first_row, encoding: "UTF-8" }
# CSV.foreach(filepath_artworks, csv_options) do |row|
#   puts "Artworks"
#   image = FastImage.size(row[5])
#   if !image ||
#      (image[1]||image[0]) > 3400 ||
#      !(image[1].fdiv(image[0]) > 1.2 && image[1].fdiv(image[0]) < 1.8)
#     puts "width : #{image[0]} height :#{image[1]} Ratio = #{image[1].fdiv(image[0])}: Image is too big " if image
#   else
#     author = Author.where(name: row[0]).first_or_create(name: row[0])
#     type = Type.where(name: row[7]).first_or_create(name: row[7])
#     puts "---- creating"
#     new_art = Artwork.create(title: row[4],
#                     mouvement: row[2],
#                     museum: row[6],
#                     author: author,
#                     type: type)
#     file = URI.open(row[5])
#     new_art.photo.attach(io: file, filename: row[4], content_type: 'image/jpg')
#   end
# end

# csv_options = { col_sep: ';', headers: :first_row, encoding: "UTF-8" }

# CSV.foreach(filepath_exhib_nn, csv_options) do |row|
#   # La ligne en dessous doit pas avoir de first_or_create ?!
#   exhibition = Exhibition.find_by(name: row[0])
#   next if exhibition.nil?
#   exhibition.update(mouvement: row[2])
#   if !row[3].nil? || row[3] != ""
#     author = Author.where(name: row[3]).first_or_create(name: row[3])
#     ExhibitionAuthor.create(exhibition_id: exhibition.id, author_id: author.id)
#   end
#   if !row[1].nil? || row[1] != ""
#     type = Type.where(name: row[1]).first_or_create(name: row[1])
#     ExhibitionType.create(exhibition_id: exhibition.id, type_id: type.id)
#   end
# end

# UserExhibition.create(exhibition: Exhibition.first, user: User.first, status: "done", date: 2.days.ago)
