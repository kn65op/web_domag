class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name, :null => false, :unique => true
      t.string :description
      t.references :user, :null => false

      t.timestamps
    end

    add_index :categories, :user_id
  end
end
