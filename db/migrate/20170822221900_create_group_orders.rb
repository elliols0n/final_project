class CreateGroupOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :group_orders do |t|
      t.string :receipt
      t.integer :price
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
