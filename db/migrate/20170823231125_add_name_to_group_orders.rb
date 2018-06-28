class AddNameToGroupOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :group_orders, :name, :string
  end
end
