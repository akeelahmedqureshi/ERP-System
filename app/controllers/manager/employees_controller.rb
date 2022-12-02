class Manager::EmployeesController < Manager::BaseController
  def index
    @employees = Employee.all
  end

  def show
    if current_employee.subordinates.include? employee
      @employee = employee
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

  def employee
    Employee.find_by(id: params[:id])
  end

end
