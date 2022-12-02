class Employee::ProjectsController < Employee::BaseController
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

  protected

  def project
    Project.find_by(id: params[:id])
  end

end