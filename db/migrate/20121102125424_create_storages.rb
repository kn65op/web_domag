class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :name, :null => false
      t.integer :parent_id
      t.string :description

      t.timestamps
    end
  end
end
