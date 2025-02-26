class StudentRepository
  def create(attributes)
    Student.create(attributes)
  end

  def delete(student)
    student.destroy
  end

  def find_by_school(school_id)
    Student.where(school_id: school_id)
  end

  def find_by_class(class_id)
    Student.where(class_id: class_id)
  end
end
