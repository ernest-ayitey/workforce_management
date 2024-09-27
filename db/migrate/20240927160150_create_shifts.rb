class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.references :weekly_shift_pattern, null: false, foreign_key: true
      t.string :shift_type
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
