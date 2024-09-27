class CreateLeaveTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :leave_types do |t|
      t.string :name

      t.timestamps
    end
    add_index :leave_types, :name, unique: true
  end
end
