class Manager::ProjectsController < Manager::BaseController
  def index
    @projects = current_employee.projects
  end

  def show
    if current_employee.projects.include? project
      @project = project
      @assigned_employees = @project.employees
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

  def assign_project_new
    @employees = current_employee.subordinates
  end
  
  def assign_project
    project = Project.find_by(id: params[:format])
    employee = Employee.find_by(id: params[:assign_to])
    if !project.employees.include?(employee)
      if employee.projects<<project
        redirect_to manager_project_path(params[:format])
      else
        render template: "error"
      end
    else
      redirect_to manager_project_path(params[:format])
    end
  end

  protected

  def project
    Project.find_by(id: params[:id])
  end

end