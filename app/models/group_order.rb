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
#

class GroupOrder < ApplicationRecord
    # mount_uploader :receipt, ReceiptUploader
    
    belongs_to :restaurant
    
    has_many :orders, :dependent => :destroy
end
