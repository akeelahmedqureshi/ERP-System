class Employee::DashboardController < Employee::BaseController
  def index
    @notices = Notice.all
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