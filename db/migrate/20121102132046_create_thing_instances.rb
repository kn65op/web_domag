class CreateThingInstances < ActiveRecord::Migration
  def change
    create_table :thing_instances do |t|
      t.date :valid_until
			t.date :purchase_date
      t.decimal :price, :precision => 12, :scale => 2
      t.references :user, :null => false
      t.references :storage, :null => false
      t.references :thing, :null => false
      t.references :shop
      t.references :manufacturer

      t.timestamps
    end
    add_index :thing_instances, :user_id
    add_index :thing_instances, :storage_id
    add_index :thing_instances, :thing_id
    add_index :thing_instances, :shop_id
    add_index :thing_instances, :manufacturer_id
  end
end
