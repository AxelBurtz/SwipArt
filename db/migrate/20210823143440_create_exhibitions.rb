class CreateExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibitions do |t|
      t.string :name
      t.string :address
      t.string :museum
      t.integer :price_expo
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
