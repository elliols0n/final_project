# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string
#  cuisine_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  menu_id    :integer
#

class Restaurant < ApplicationRecord
    has_many :menus, :dependent => :destroy
    
    has_many :group_orders, :dependent => :destroy
    
    has_many :orders, :dependent => :destroy
    
    belongs_to :cuisine
    
    validates :cuisine, :presence => true
    validates :name, :presence => true
end
