class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references  :item_group
      t.string      :sku 
      t.string      :price
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
