class CreateItemGroupAttributes < ActiveRecord::Migration
  def self.up
    create_table :group_specs do |t|
      t.references  :group
      t.string      :name
      t.text        :default_value
      t.integer     :position 
      t.timestamps
    end
  end

  def self.down
    drop_table :group_specs
  end
end
