class Hr::AttendencesController < Hr::BaseController
  def index
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    @leaves = current_employee.leaves.where("status = ?", 'Approve')
    @date = date
    @attendences = @employee.attendences.where("created_at >= ? AND created_at <=?", @date.at_beginning_of_month, @date.at_end_of_month)
  end

  def new
  end

  def create
    if isvalid?
      attendence = Attendence.new()
      attendence.punch_in = Time.now.strftime("%H:%M")
      attendence.employee_id = current_employee.id
      attendence.save
    end
  end

  def edit
  end

  def update
    attendence = Attendence.find_by(id: params[:id])
    attendence.punch_out = Time.now.strftime("%H:%M")
    attendence.update(total_time: total_time(attendence))
  end

  def destroy
  end

  protected

  def isvalid?
    current_employee.attendences.last.created_at.to_date != DateTime.now.to_date
  end

  def date
    if params[:format].present?
      parameters = params[:format].split("/")
      if parameters[1] == "previous"
        parameters[0].to_date - 1.month
      else
        parameters[0].to_date + 1.month
      end
    else
      Date.today
    end
  end

  def total_time(attendence)
    totalTime = attendence.punch_out.to_time - attendence.punch_in.to_time
    time = "#{(totalTime / 3600).to_i}:#{(totalTime / 60) % 60}"
  end

end
