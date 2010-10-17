class ItemGroup < ActiveRecord::Base
  belongs_to :product
  has_many :item_group_attributes
end
