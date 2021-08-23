class CreateExhibitionAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_authors do |t|
      t.references :author, null: false, foreign_key: true
      t.references :exhibition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
