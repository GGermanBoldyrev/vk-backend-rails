class Classroom < ApplicationRecord
  belongs_to :school
  has_many :students, dependent: :destroy

  validates :number, presence: true
  validates :letter, presence: true
  validates :number, uniqueness: { scope: [:letter, :school_id],
                                   message: "Класс с таким номером и буквой уже существует в этой школе" }
end
