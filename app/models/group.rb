class Group < ActiveRecord::Base
  belongs_to :product
  has_many :group_specs
  has_many :items
  
end
