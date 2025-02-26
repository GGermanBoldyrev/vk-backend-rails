class StudentService
  def initialize(repository = StudentRepository.new)
    @repository = repository
  end

  def list_all
    @repository.all
  end

  def find(student_id)
    @repository.find(student_id)
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
end
