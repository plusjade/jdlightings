class CreateItemAttributes < ActiveRecord::Migration
  def self.up
    create_table :item_attributes do |t|
      t.references  :item
      t.references  :item_group_attribute
      t.string      :value
      t.timestamps
    end
  end

  def self.down
    drop_table :item_attributes
  end
end
