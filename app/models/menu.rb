# == Schema Information
#
# Table name: menus
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Menu < ApplicationRecord
    belongs_to :restaurant
    
    has_many :dishes, :dependent => :destroy
end
