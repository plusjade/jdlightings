class GroupSpec < ActiveRecord::Base
  belongs_to :group
  has_many :specs
  
  #scope :sorted, where(:color => 'red')
  default_scope :order => 'position ASC'


  
  
end
