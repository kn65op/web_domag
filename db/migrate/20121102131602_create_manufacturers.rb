class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name, :null  => false, :unique => true
      t.references :user, :null => false

      t.timestamps
    end
  end
end
