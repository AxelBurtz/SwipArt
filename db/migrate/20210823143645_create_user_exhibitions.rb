class CreateUserExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_exhibitions do |t|
      t.datetime :date
      t.integer :price
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :exhibition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
