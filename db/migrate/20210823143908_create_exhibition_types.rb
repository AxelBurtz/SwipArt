class CreateExhibitionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibition_types do |t|
      t.references :type, null: false, foreign_key: true
      t.references :exhbition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
