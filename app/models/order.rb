# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  dish_id        :integer
#  user_comment   :string
#  group_order_id :integer
#  restaurant_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  menu_id        :integer
#

class Order < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    belongs_to :dish
    belongs_to :menu
    belongs_to :group_order
    
    validates :dish, :presence => true
    validates :restaurant, :presence => true
end
