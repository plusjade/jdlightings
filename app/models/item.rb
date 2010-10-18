class Item < ActiveRecord::Base
  belongs_to :group
  has_many :specs, :dependent => :destroy
  
  
  def specs_for_display
    h = {}
    self.specs.each do |spec|
      h[spec.group_spec_id] = spec.value
    end
    h
    #return self.specs.dup.map!{ |s| {s.group_spec_id => s.value} }  
  end
  
  
end
