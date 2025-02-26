class ClassroomService
  def initialize(repository = ClassroomRepository.new)
    @repository = repository
  end

  def exists_in_school?(class_id, school_id)
    @repository.exists_in_school?(class_id, school_id)
  end

  def list_by_school(school_id)
    @repository.find_by_school(school_id)
  end
end