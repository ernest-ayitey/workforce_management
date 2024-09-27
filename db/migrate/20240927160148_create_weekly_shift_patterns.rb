class CreateWeeklyShiftPatterns < ActiveRecord::Migration[7.1]
  def change
    create_table :weekly_shift_patterns do |t|
      t.references :monthly_schedule, null: false, foreign_key: true
      t.integer :week_number
      t.integer :night_shift_count
      t.integer :day_shift_count
      t.integer :evening_shift_count

      t.timestamps
    end
  end
end
