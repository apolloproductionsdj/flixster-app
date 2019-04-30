class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def create
    flash[:notice] = "You Must Be Enrolled"
    redirect_to course_path(current_lesson)
  end

  def show
    current_lesson.section.course(lesson: current_lesson)
    redirect_to course_path(current_lesson) 
  end

  private

def require_authorized_for_current_lesson
   if current_lesson.user != current_user
    flash :notice "You Must Be Enrolled"
   end 
 end 


  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
