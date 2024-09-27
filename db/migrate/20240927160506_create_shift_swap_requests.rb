class CreateShiftSwapRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :shift_swap_requests do |t|
      t.references :requesting_user, foreign_key: { to_table: :users }, null: false
      t.references :requested_user, foreign_key: { to_table: :users }, null: false
      t.references :shift, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
