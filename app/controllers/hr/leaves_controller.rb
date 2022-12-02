class Hr::LeavesController < Hr::BaseController
  def index

  end

  def show

  end

  def new
    @leave = Leave.new()
  end

  def create
    @leave = Leave.new(leave_params)
    @leave.employee_id = current_employee.id
    @leave.status = "Pending"
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
    params.require(:leave).permit(:start_date, :end_date, :reason)
  end
end