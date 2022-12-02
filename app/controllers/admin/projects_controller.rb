class Admin::ProjectsController < Admin::BaseController
  def index
    # @employees = Employee.all.filter {|e| e.roles.first.name == "manager"}
    @projects = Project.all
  end

  def show
    @project = project
    @assigned_employees = @project.employees
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to [:admin, @project]
    else
      render :new
    end
  end

  def edit
    @project = project
  end

  def update
    @project = project

    if @project.update(project_params)
      redirect_to [:admin, @project]
    else
      render :new
    end
  end

  def destroy
    @project = project

    if @project.destroy
      redirect_to [:admin, @projects]
    else
      redirect_to [:admin, @project]
    end
  end

  def assign_project_new
    # @project = Project.find_by(id: params[:format])
    @employees = Employee.all.filter {|e| e.roles.first.name == "manager"}
  end
  
  def assign_project
    project = Project.find_by(id: params[:format])
    employee = Employee.find_by(id: params[:assign_to])
    if !project.employees.include?(employee)
      if employee.projects<<project
        redirect_to admin_project_path(params[:format])
      else
        render template: "error"
      end
    else
      redirect_to admin_project_path(params[:format])
    end
  end

  protected

  def project
    Project.find_by(id: params[:id])
  end
  
  def project_params    
    params.require(:project).permit(:project_name, :project_description, :project_deadline)
  end
end