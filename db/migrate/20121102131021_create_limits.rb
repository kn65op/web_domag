class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.float :critical
      t.float :ends
      t.float :full
			t.references :user
			t.references :thing

      t.timestamps
    end

    add_index :limits, :user_id
    add_index :limits, :thing_id
  end
end
