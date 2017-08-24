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
#

class GroupOrder < ApplicationRecord
    # mount_uploader :receipt, ReceiptUploader
    
    belongs_to :restaurant
    
    has_many :orders, :dependent => :destroy
    
    has_one :menu
    
    has_many :users, :through => :orders, :source => :users
    
    validates :name, :presence => true
end
