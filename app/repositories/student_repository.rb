class StudentRepository
  def all
    Student.all
  end

  def find(student_id)
    Student.find_by(id: student_id)
  end

  def create(attributes)
    Student.create(attributes)
  end

  def delete(student)
    student.destroy
  end
end
