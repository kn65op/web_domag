class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.float :critical
      t.float :ends
      t.float :full

      t.timestamps
    end
  end
end
