class CreateItemGroups < ActiveRecord::Migration
  def self.up
    create_table :item_groups do |t|
      t.references  :product
      t.string      :name 
      t.text        :description
      t.timestamps
    end
  end

  def self.down
    drop_table :item_groups
  end
end
