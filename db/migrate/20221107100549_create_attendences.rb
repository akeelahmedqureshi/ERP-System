class CreateAttendences < ActiveRecord::Migration[7.0]
  def change
    create_table :attendences do |t|
      t.time :punch_in
      t.time :punch_out
      t.time :total_time
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
