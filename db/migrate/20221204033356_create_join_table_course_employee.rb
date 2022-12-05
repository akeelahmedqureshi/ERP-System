class CreateJoinTableCourseEmployee < ActiveRecord::Migration[7.0]
  def change
    create_join_table :courses, :employees do |t|
      # t.index [:course_id, :employee_id]
      # t.index [:employee_id, :course_id]
    end
  end
end
