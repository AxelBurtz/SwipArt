class AddColumsToExhibitions < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibitions, :mouvement, :string
  end
end
