class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references  :category
      t.string      :name 
      t.string      :url_slug
      t.text        :description
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
