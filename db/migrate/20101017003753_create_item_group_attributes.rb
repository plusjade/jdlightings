class CreateItemGroupAttributes < ActiveRecord::Migration
  def self.up
    create_table :item_group_attributes do |t|
      t.references  :item_group
      t.string      :name
      t.text        :default_value
      t.integer     :position 
      t.timestamps
    end
  end

  def self.down
    drop_table :item_group_attributes
  end
end
