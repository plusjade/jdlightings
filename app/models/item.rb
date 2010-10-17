class Item < ActiveRecord::Base
  belongs_to :item_group
  has_many :item_attributes
end
