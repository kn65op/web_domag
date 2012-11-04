class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string :name, :null => false, :unique => true
      t.string :unit, :null => false, :unique => true
      t.string :descripion
			t.references :category, :null => false

      t.timestamps
    end
  end
end
