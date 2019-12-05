class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name 
    @slogan = slogan 
    @student_capacity = student_capacity
    @students = []
    @teachers = []
    @grades = Hash.new{|h, k| h[k] = []}
  end 

  def name 
    @name 
  end 

  def slogan 
    @slogan 
  end 

  def teachers 
    @teachers 
  end

  def students 
    @students 
  end
  
  def hire(teacher)
    @teachers << teacher
  end 

  def enroll(student)
    if @students.length < @student_capacity
        @students << student 
        true
    else 
        false 
    end
  end 

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade 
        true 
    else 
        false 
    end
  end

  def num_grades(student)
    @grades[student].count
  end

  def average_grade(student)
    @grades[student].reduce(:+) / num_grades(student) if enrolled?(student) && num_grades(student) > 0
  end
end
