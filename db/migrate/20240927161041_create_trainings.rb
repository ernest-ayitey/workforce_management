class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :course_name
      t.date :completion_date
      t.string :status

      t.timestamps
    end
  end
end
