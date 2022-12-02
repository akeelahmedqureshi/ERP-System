module AdminHelper
  def is_admin?
    # debugger
    if is_admin
      # debugger
      redirect_to admin_employees_path
    else
      root_path
    end
  end
  
end