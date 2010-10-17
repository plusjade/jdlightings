class Spec < ActiveRecord::Base
  belongs_to :item
  belongs_to :group_spec
end
