class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :price
			t.date :date, :null => false
      t.references :shop
      t.references :manufacturer

      t.timestamps
    end
    add_index :purchases, :shop_id
    add_index :purchases, :manufacturer_id
  end
end
