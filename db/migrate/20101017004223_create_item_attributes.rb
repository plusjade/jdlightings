class CreateItemAttributes < ActiveRecord::Migration
  def self.up
    create_table :specs do |t|
      t.references  :item
      t.references  :group_spec
      t.string      :value
      t.timestamps
    end
  end

  def self.down
    drop_table :specs
  end
end
