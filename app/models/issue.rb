class Issue < ApplicationRecord
  belongs_to :employee

  # scope :subordinates_issues, -> { where("employee_id = ? OR manager_id = ? ", current_employee.id)}
end
