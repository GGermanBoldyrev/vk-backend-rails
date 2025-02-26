class SchoolRepository
  def exists?(school_id)
    School.exists?(id: school_id)
  end
end
