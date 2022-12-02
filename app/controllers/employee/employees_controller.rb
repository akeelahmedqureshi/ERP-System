class Employee::EmployeesController < Employee::BaseController
  def index
    @employees = Employee.includes(:roles)
  end

  def show
    if current_employee.id.to_s == params[:id]
      @employee = current_employee
    end
  end

  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

end
