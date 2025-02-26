class SchoolService
  def initialize(repository = SchoolRepository.new)
    @repository = repository
  end

  def exists?(school_id)
    @repository.exists?(school_id)
  end
end
