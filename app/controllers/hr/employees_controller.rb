class Hr::EmployeesController < Hr::BaseController
  def index
    @employees = Employee.all
  end

  def show
    @employee = employee
  end

  def new
    @employee = Employee.new
  end

  def create
    role = params[:employee].delete :role
    @employee = Employee.new(params_employees)
    if @employee.save
      Employee.last.add_role(role) if Employee.last.roles.blank?
      redirect_to [:hr, @employee] 
    else
      render :new
    end
  end

  def edit
    @employee = employee
  end

  def update
    role = params[:employee].delete :role
    @employee = employee
    if @employee.update(params_employees)
      if @employee.roles.first.name != role
        @employee.roles.clear
        @employee.add_role(role) if @employee.roles.blank?
      end
      redirect_to [:hr, @employee]
    else
      render :new
    end
  end

  def destroy
  end

  protected

  def employee
    Employee.find_by(id: params[:id])
  end

  def params_employees
    if params[:employee][:password].present?
      params.require(:employee).permit(:email, :password, :password_confirmation, :name, :post)
    else
      params.require(:employee).permit(:email, :name, :post)
    end
  end

end
