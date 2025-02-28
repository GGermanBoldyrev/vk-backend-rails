class StudentService
  def initialize(repository = StudentRepository.new)
    @repository = repository
  end

  def create(student_dto)
  # Проверяем существование класса
  raise 'Класс не найден' unless Classroom.exists?(student_dto.class_id)

  # Создаем ученика и проверяем на ошибки
  student = Student.new(student_dto.to_h)

  if student.save
    StudentLogger.log_creation(student)
    return student
  else
    raise 'Ошибка при создании ученика: ' + student.errors.full_messages.join(', ')
  end
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
