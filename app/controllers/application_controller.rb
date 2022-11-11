class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_employee!
  before_action :check_current_user


  protected

  def check_current_user
    if current_employee.present?
      # debugger
      # case current_employee.role
      # when "admin"
        
      # when "hr"

      # when "manager"

      # when "employee"
      #   debugger
      # else
        
      # end
    else
      # debugger
      new_employee_session_path
    end

  end

  def check_role
    puts current_employee.role
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name, :post])
  end

end