class CreateArtworks < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :mouvement
      t.string :museum
      t.integer :creation_date

      t.timestamps
    end
  end
end
