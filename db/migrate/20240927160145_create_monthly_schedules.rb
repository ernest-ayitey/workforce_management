class CreateMonthlySchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_schedules do |t|
      t.integer :year
      t.integer :month
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
