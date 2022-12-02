class Hr::DashboardController < Hr::BaseController
  def index
    @notices = Notice.all
    @leaves = Leafe.joins(:employee).all.filter { |leave| leave.employee.roles.first.name == "manager" && leave.status == "Pending"}
    @leave = current_employee.leaves.where("status = ? ", "Pending")
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