class StudentLogger
  def self.log_creation(student)
    Rails.logger.info "Студент #{student.full_name} (ID: #{student.id}) был создан"
  end

  def self.log_deletion(student)
    Rails.logger.warn "Студент #{student.full_name} (ID: #{student.id}) был удален"
  end
end
