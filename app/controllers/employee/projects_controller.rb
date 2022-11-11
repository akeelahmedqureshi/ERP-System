class Employee::ProjectsController < Employee::BaseController
  def index
    @projects = Projects.all
  end
end
