class CreateJoinTableEmployeeProject < ActiveRecord::Migration[7.0]
  def change
    create_join_table :employees, :projects do |t|
      # t.index [:employee_id, :project_id]
      # t.index [:project_id, :employee_id]
    end
  end
end
