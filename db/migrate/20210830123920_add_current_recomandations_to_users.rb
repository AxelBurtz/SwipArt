class AddCurrentRecomandationsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :current_recomandations, :string
  end
end
