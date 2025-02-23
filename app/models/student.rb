class Student < ApplicationRecord
  belongs_to :school_class
  belongs_to :school
end
