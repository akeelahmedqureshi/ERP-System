class Hr::NoticesController < Hr::BaseController
  def index
    @notices = Notice.all
  end

  def show
    @notice = notice    
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    if @notice.save
      redirect_to [:hr, @notice]
    else
      render :new
    end
  end

  def edit
    @notice = notice
  end

  def update
    @notice = notice
    if @notice.update(notice_params)
      redirect_to [:hr, @notice]
    else
      render :new
    end
  end

  def destroy
  end

  protected

  def notice
    Notice.find_by(id: params[:id])
  end

  def notice_params  
    params.require(:notice).permit(:subject, :description)
  end
end