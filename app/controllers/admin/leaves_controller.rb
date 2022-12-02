class Admin::LeavesController < Admin::BaseController
  def index

  end

  def show

  end

  def new
    @leave = Leafe.new()
  end

  def create
    @leave = Leafe.new(leave_params)
    @leave.employee_id = current_employee.id
    @leave.status = "Approve"
    if @leave.save
      redirect_to [:hr, @leave]
    else
      render :new
    end
  end

  def edit
  end

  def update
    @leave = Leafe.find_by(id: params[:id])
    if @leave.update(status: params[:status])
      redirect_to root_path
    else
      render template: "error"
    end
  end

  def destroy
  end

  protected

  def leave_params
    params.require(:leafe).permit(:start_date, :end_date, :employee_id)
  end
end