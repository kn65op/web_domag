class CreateUsersStorages < ActiveRecord::Migration
  def change
    create_table :users_storages do |t|
      t.references :user, :null => false 
      t.references :storage, :null => false 
      t.boolean :admin, :null => false 

      t.timestamps
    end
    add_index :users_storages, :user_id
    add_index :users_storages, :storage_id
  end
end
