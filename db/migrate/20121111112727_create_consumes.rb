class CreateConsumes < ActiveRecord::Migration
  def change
    create_table :consumes do |t|
      t.date :date, :null => false
      t.string :purpose
      t.float :amount, :null => false
      t.references :thing_instance, :null => false

      t.timestamps
    end
    add_index :consumes, :thing_instance_id
  end
end
