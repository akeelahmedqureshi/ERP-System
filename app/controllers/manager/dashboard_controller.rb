class Manager::DashboardController < Manager::BaseController
  def index
    @notices = Notice.all
    @leaves = Leafe.joins(:employee).all.filter { |leave| leave.employee.roles.first.name == "employee" && leave.status == "Pending"}
  end

  # def show
  # end

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