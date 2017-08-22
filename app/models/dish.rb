# == Schema Information
#
# Table name: dishes
#
#  id         :integer          not null, primary key
#  name       :string
#  menu_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dish < ApplicationRecord
    belongs_to :menu
    
    has_many :orders, :dependent => :destroy
end
