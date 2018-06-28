class AddMenuIdToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :menu_id, :integer
  end
end
