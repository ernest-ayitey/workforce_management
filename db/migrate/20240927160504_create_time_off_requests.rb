class CreateTimeOffRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :time_off_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :leave_type, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :reason
      t.string :status

      t.timestamps
    end
  end
end
