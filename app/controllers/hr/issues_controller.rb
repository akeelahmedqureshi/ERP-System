class Hr::IssuesController < Hr::BaseController
  def index
    @issues = Issue.all
  end

  def show
    @issue = issue
  end

  def new
    @issue = Issue.new  
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.employee_id = current_employee_id
    if @issue.save
      redirect_to [:hr, @issue]
    else
      render :new
    end
  end

  def edit
    @issue = issue
  end

  def update
    @issue = issue
    if @issue.update(issue_params)
      redirect_to [:hr, @issue]
    else
      render :new
    end
  end

  def destroy
  end

  protected

  def issue
    Issue.find_by(id: params[:id])
  end

  def issue_params  
    params.require(:issue).permit(:subject, :description, :priority, :employee_id)
  end
end