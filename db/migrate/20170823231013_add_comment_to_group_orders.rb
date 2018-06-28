class AddCommentToGroupOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :group_orders, :comment, :string
  end
end
