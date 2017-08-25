class AddMenuNameToGroupOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :group_orders, :menu_id, :integer
  end
end
