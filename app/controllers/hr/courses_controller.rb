class Hr::CoursesController < Hr::BaseController
    def index
        @courses = Course.all
    end

    def show
      @course = Course.find_by(id: params[:id])
    end

    def new
      @course = Course.new
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to hr_courses_path
      else
        render :new
      end
    end

    def destroy
      course = Course.find_by(id: params[:id])
      if course.destroy
        redirect_to hr_courses_path
      end
    end

    protected

    def course_params
      params.require(:course).permit(:title, :description, :price)
    end
  end