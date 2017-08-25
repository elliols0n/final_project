# == Schema Information
#
# Table name: group_orders
#
#  id            :integer          not null, primary key
#  receipt       :string
#  price         :integer
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  comment       :string
#  name          :string
#  menu_id       :integer
#

class GroupOrder < ApplicationRecord
    # mount_uploader :receipt, ReceiptUploader
    
    belongs_to :restaurant
    
    belongs_to :menu
    
    has_many :orders, :dependent => :destroy
    
    has_many :users, :through => :orders, :source => :users
    
    validates :name, :presence => true
end
