class Manager::CoursesController < Manager::BaseController
    def index
        @courses = Course.all
    end

    def show
      @course = Course.find_by(id: params[:id])
    end

    protected

    def course_params
      params.require(:course).permit(:title, :description, :price)
    end
  end