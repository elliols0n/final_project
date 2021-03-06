# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ApplicationRecord
    has_many :restaurants, :dependent => :nullify
    
    validates :name, :presence => true
    validates :name, :uniqueness => true
end
