class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :menu_id

      t.timestamps

    end
  end
end
