require_dependency 'student_dto'

module Api
  module V1
    class StudentsController < ApplicationController
      def create
        student_dto = StudentDTO.new(student_params)
        student = StudentService.new.create(student_dto)

        render json: student, status: :created
      rescue => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    
      def destroy
        student = StudentService.new.find(params[:id])
        
        if student
          result = StudentService.new.delete(params[:id])
          if result
            render json: { message: 'Студент удален' }, status: :ok
          else
            render json: { error: 'Ошибка удаления' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Некорректный id студента' }, status: :bad_request
        end
      end

      def by_school
        unless SchoolService.new.exists?(params[:school_id])
          return render json: { error: 'Школа не найдена' }, status: :not_found
        end

        unless ClassroomService.new.exists_in_school?(params[:class_id], params[:school_id])
          return render json: { error: 'Класс не найден в данной школе' }, status: :not_found
        end

        students = StudentService.new.list_by_class(params[:class_id])
        render json: { data: students }, status: :ok
      end
    
      private
    
      def student_params
        params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
      end
    end    
  end
end