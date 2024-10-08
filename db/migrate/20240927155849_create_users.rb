class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.references :role, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
