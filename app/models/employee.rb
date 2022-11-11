class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role
  
  rolify :before_add => :before_add_method

  def before_add_method(role)
    # do something before it gets added
  end
  
  protected
  
  def assign_default_role
    # debugger
    # role = current_employee.role
    # self.add_role(:manager) if self.roles.blank?
    Employee.last.add_role(:manager) if Employee.last.roles.blank?
  end
end
