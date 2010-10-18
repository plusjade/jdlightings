class Group < ActiveRecord::Base
  belongs_to :product
  has_many :group_specs, :dependent => :destroy
  has_many :items
  
end
