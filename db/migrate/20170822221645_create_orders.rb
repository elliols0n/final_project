class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :dish_id
      t.string :user_comment
      t.integer :group_order_id
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
