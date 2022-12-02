class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_employee!
  
  include ApplicationHelper
  # after_action :check_current_user
  
  def after_sign_in_path_for(resource)
    # Destroy notice after 10 days
    Notice.expired_notices.destroy_all

    case resource.roles.first.name
    when "admin"
      return admin_root_path
    when "hr"
      return hr_root_path
    when "manager"
      return manager_root_path
    when "employee"
      return employee_root_path
    end
  end
  
  protected 

  # def check_current_user
  #   if current_employee.present?
  #     # debugger
  #     case check_role
  #     when "admin"
  #       debugger
  #       return admin_employees_path
  #     when "hr"
  #       debugger
  #       return hr_employees_path
  #     when "manager"
  #       debugger
  #       return manager_employees_path
  #     when "employee"
  #       debugger
  #       return employeee_employees_path
  #     end
  #   else
  #     # debugger
  #     new_employee_session_path
  #   end

  # end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :post])
  end

end