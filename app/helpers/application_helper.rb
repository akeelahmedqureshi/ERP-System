module ApplicationHelper

  def check_role
    # debugger
    current_employee.roles.first.name
  end

  def is_admin
    # debugger
    check_role == "admin"
  end
  def is_hr
    # debugger
    check_role == "hr"
  end
  def is_manager
    # debugger
    check_role == "manager"
  end
  def is_employee
    # debugger
    check_role == "employee"
  end
end
