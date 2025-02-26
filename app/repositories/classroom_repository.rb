class ClassroomRepository
  def find_by_school(school_id)
    Classroom.where(school_id: school_id)
  end

  def exists_in_school?(class_id, school_id)
    School.joins(:classrooms).where(id: school_id, classrooms: { id: class_id }).exists?
  end
end
