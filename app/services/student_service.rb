class StudentService
  def initialize(repository = StudentRepository.new)
    @repository = repository
  end

  def create(student_dto)
    student = @repository.create(student_dto.to_h)
    StudentLogger.log_creation(student) if student
    student
  end

  def delete(student_id)
    student = @repository.find(student_id)
    return false unless student

    StudentLogger.log_deletion(student)
    @repository.delete(student)
  end

  def list_by_school(school_id)
    @repository.find_by_school(school_id)
  end

  def list_by_class(class_id)
    @repository.find_by_class(class_id)
  end
end
