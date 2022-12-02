class HomeController < ApplicationController
  # include ApplicationHelper
  include AdminHelper

  before_action :is_admin?
  def index
    # redirect_to 'admin_employees_path'
    # redirect_to "admin/employees#index"
    # debugger
    render 
  end
  def show
  end


  protected

  # def is_admin?
  #   debugger
  #   if is_admin
  #     debugger
  #     # redirect_to admin_employees_path
  #   else
  #     root_path
  #   end
  # end
  # def is_manager?
  #   debugger
  #   if is_manager
  #     debugger
  #     render "show" 
  #   else
  #     root_path
  #   end
  # end
end