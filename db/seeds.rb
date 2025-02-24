# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do
  school = FactoryBot.create(:school)
  
  3.times do
    classroom = FactoryBot.create(:classroom, school: school)

    10.times do
      FactoryBot.create(:student, classroom: classroom, school: school)
    end
  end
end

puts "Таблицы: schools, classrooms, students - заполнены тестовыми значениями"