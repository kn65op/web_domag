class CreateThingInstances < ActiveRecord::Migration
  def change
    create_table :thing_instances do |t|
      t.date :valid_until
      t.references :user, :null => false
      t.references :storage, :null => false
      t.references :purchase, :null => false
      t.references :thing, :null => false
			t.references :consume

      t.timestamps
    end
    add_index :thing_instances, :user_id
    add_index :thing_instances, :storage_id
    add_index :thing_instances, :purchase_id
    add_index :thing_instances, :thing_id
		add_index :thing_instances, :consume_id
  end
end
