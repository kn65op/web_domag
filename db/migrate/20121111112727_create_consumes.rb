class CreateConsumes < ActiveRecord::Migration
  def change
    create_table :consumes do |t|
      t.date :date, :null => false
      t.string :purpose
      t.decimal :amount, :null => false, :precision => 20, :scale => 3
      t.references :thing_instance, :null => false
      t.references :user, :null => false

      t.timestamps
    end
    add_index :consumes, :thing_instance_id
    add_index :consumes, :user_id
  end
end
