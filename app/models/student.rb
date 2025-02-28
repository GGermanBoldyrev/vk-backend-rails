class Student < ApplicationRecord
  belongs_to :classroom, foreign_key: 'class_id', counter_cache: true
  belongs_to :school

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :surname, presence: true
  validates :class_id, presence: true
  validates :school_id, presence: true

  def full_name
    "#{first_name} #{last_name} #{surname}"
  end
end
