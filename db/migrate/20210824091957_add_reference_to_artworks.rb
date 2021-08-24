class AddReferenceToArtworks < ActiveRecord::Migration[6.0]
  def change
    add_reference :artworks, :author, foreign_key: true
    add_reference :artworks, :type, foreign_key: true
  end
end
