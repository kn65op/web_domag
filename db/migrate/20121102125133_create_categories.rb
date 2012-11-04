class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name, :null => false, :unique => true
      t.string :description

      t.timestamps
    end
  end
end
