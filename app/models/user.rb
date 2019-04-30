class User < ApplicationRecord
 
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course 
  has_many :lessons
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(course)
    return enrolled_courses.include?(course)
  end

  def enrolled_in?(lesson)
    enrolled_lessons = []
    enrollments.each do |enrollment|
      enrolled_lessons << enrollment.lesson
    end 

    return enrolled_lessons.include?(lesoson)
  end 

end 

