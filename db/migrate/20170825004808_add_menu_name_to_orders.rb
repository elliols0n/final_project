class AddMenuNameToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :menu_id, :integer
  end
end
