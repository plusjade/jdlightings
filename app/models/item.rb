class Item < ActiveRecord::Base
  belongs_to :group
  has_many :specs
  
  
  def specs_for_display
    h = {}
    self.specs.each do |spec|
      h[spec.group_spec_id] = spec.value
    end
    h  
  end
  
  
end
