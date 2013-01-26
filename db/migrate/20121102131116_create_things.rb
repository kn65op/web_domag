class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name, :null => false
      t.string :unit, :null => false
      t.string :description
			t.references :category, :null => false

      t.timestamps
    end
    add_index :things, :category_id
  end
end
