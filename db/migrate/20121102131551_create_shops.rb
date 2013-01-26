class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name, :null => false
      t.string :address
      t.references :user

      t.timestamps
    end
  end
end
